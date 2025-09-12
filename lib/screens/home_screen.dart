import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studybuddy/models/user_model.dart';
import 'package:studybuddy/providers/group_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'StudyBuddy',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Stack(
          children: [
            Positioned(
              // top: 10,
              left: 18,
              child: Text(
                'Welcome back, User',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 25,
              child: SizedBox(
                height: 190,
                width: 600,
                child: Consumer<GroupProvider>(
                  builder: (context, GroupProvider, child) {
                    final groups = GroupProvider.groups;
                    if (groups.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Center(
                          child: Text(
                            'No groups yet. Create one!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white30,
                            ),
                          ),
                        ),
                      );
                    }
                    return GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: groups.length,
                      itemBuilder: (context, index) {
                        final group = groups[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {}, //for going to group page
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        group.logoUrl != null
                                            ? NetworkImage(group.logoUrl!)
                                            : AssetImage(
                                              'assets/default_logo.png',
                                            ), // as ImageProvider,
                                    child:
                                        group.logoUrl == null
                                            ? Text(
                                              'G',
                                              style: TextStyle(fontSize: 40),
                                            )
                                            : null,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    group.groupName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              right: 130,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/creategroup');
                },
                child: Text('Create Group',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA8BEE7FF),
                  foregroundColor: Colors.black,
                  shadowColor: Colors.white,
                  elevation: 5,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
