import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/group_model.dart';

class GroupProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<GroupModel> _groups = [];
  List<GroupModel> get groups => _groups;
  GroupProvider() {
    _loadGroups();
  }
  Future<void> _loadGroups() async {
    final user = _auth.currentUser;
    if (user != null) {
      final snapshot =
          await _firestore
              .collection('groups')
              .where('members', arrayContains: user.uid)
              .get();
      _groups =
          snapshot.docs.map((doc) => GroupModel.fromMap(doc.data())).toList();
      notifyListeners();
    }
  }

  Future<void> _createGroup(String groupName, String? logoUrl) async {
    final user = _auth.currentUser;
    if (user != null) {
      final groupId = _firestore.collection('groups').doc().id;
      final newGroup = GroupModel(
        groupId: groupId,
        groupName: groupName,
        logoUrl: logoUrl,
        members: [user.uid],
        createdBy: user.uid,
      );
      await _firestore.collection('groups').doc(groupId).set(newGroup.toMap());
      await _loadGroups();
    }
  }
}
