import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
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
                'Welcome back,User',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23,color: Colors.white),
              ),
            ),
            Positioned(
              top: 60,
              left: 25,
              child: SizedBox(
                height: 120,
                // width: 600,
                child: Consumer<GroupProvider>(
                  builder: (context, GroupProvider, child) {
                    final groups = GroupProvider.groups;
                    if (groups.isEmpty) {
                      return Center(child: Text('No groups yet. Create one!'));
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: groups.length,
                      itemBuilder: (context, index) {
                        final group = groups[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {}, //for going to group page
                            child: CircleAvatar(
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
                                        style: TextStyle(fontSize: 30),
                                      )
                                      : null,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            // Positioned(
            //   bottom: 50,
            //   right: 20,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: Text('Create Group'),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFA8BEE7FF),
        onPressed: () {},
        child: Icon(Icons.add, size: 40, color: Colors.black),
      ),
    );
  }
}
