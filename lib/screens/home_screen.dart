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
    final groupProvider = Provider.of<GroupProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'StudyBuddy',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 2,
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/creategroup');
        },
        label: const Text(
          'Create Group',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        icon: const Icon(Icons.group_add),
        backgroundColor: const Color(0xFFA8BEE7FF),
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back, User 👋',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer<GroupProvider>(
                builder: (context, provider, child) {
                  final groups = provider.groups;

                  if (groups.isEmpty) {
                    return const Center(
                      child: Text(
                        'No groups yet. Create one!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white30,
                        ),
                      ),
                    );
                  }

                  final crossAxisCount =
                      MediaQuery.of(context).size.width > 600 ? 3 : 2;

                  return GridView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: groups.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      final group = groups[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 5,
                          color: Colors.grey[900],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    group.logoUrl != null
                                        ? NetworkImage(group.logoUrl!)
                                        : const AssetImage(
                                              'assets/default_logo.png',
                                            )
                                            as ImageProvider,
                                child:
                                    group.logoUrl == null
                                        ? Text(
                                          group.groupName.isNotEmpty
                                              ? group.groupName[0].toUpperCase()
                                              : "G",
                                          style: const TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        )
                                        : null,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                group.groupName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
