class GroupModel {
  final String groupId;
  final String groupName;
  final String? logoUrl;
  final List<String> members;
  final String createdBy;

  GroupModel({
    required this.groupId,
    required this.groupName,
    this.logoUrl,
    required this.members,
    required this.createdBy,
  });
  factory GroupModel.fromMap(Map<String, dynamic> data) {
    return GroupModel(
      groupId: data['groupId'] ?? '',
      groupName: data['groupName'] ?? 'Unnamed Group',
      logoUrl: data['logoUrl'],
      members: List<String>.from(data['members']??[]),
      createdBy: data['createdBy'] ?? '',
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'groupId':groupId,
      'groupName':groupName,
      'logoUrl':logoUrl,
      'members':members,
      'createdBy':createdBy,
    };
  }
}
