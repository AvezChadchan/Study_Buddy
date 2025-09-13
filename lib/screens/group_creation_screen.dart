import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studybuddy/providers/group_provider.dart';

class GroupCreationScreen extends StatefulWidget {
  @override
  State<GroupCreationScreen> createState() => _GroupCreationScreenState();
}

class _GroupCreationScreenState extends State<GroupCreationScreen> {
  final _groupNameController = TextEditingController();
  final _logoUrlController = TextEditingController();

  void _createGroup() async {
    if (_groupNameController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please Enter a Group Name!")));
      return;
    }
    final groupProvider = Provider.of<GroupProvider>(context, listen: false);
    await groupProvider.createGroup(
      _groupNameController.text,
      _logoUrlController.text.isNotEmpty ? _logoUrlController.text : null,
    );
    Navigator.pop(context);
  }

  void dispose() {
    _groupNameController.dispose();
    _logoUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Group",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            TextField(controller: _groupNameController),
            TextField(controller: _logoUrlController),
            ElevatedButton(
              onPressed: _createGroup,
              child: Text("Create Group"),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTextField({required textController, required labelText}) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(labelText: labelText),
    );
  }
}
