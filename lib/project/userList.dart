import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'UpdateUser.dart';
import 'userdetail.dart';
import 'database/database_helper.dart';
import 'package:first/project/addUser.dart';

class UserList extends StatefulWidget {
  final List<Map<String, dynamic>> users;
  final List<Map<String, dynamic>> favoriteUsers;

  UserList({Key? key, required this.users, required this.favoriteUsers})
      : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  String searchQuery = '';
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  void _fetchUsers() async {
    List<Map<String, dynamic>> usersFromDb = await dbHelper.getUsers();
    setState(() {
      widget.users.clear();
      widget.users.addAll(usersFromDb);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredUsers = widget.users.where((user) {
      return user['fullName']
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          user['city'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          user['email'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          user['mobile'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final newUser = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddUser()),
              );

              if (newUser != null && newUser is Map<String, dynamic>) {
                _fetchUsers();
              }
            },
          ),
        ],
      ),
      backgroundColor: Colors.pink[50],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Users',
                prefixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];

                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      border: Border.all(color: Colors.pink, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.blueAccent,
                                child: Text(
                                  user['fullName'][0].toUpperCase(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user['fullName'],
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    const SizedBox(height: 4),
                                    _buildInfoRow(Icons.email, user['email']),
                                    _buildInfoRow(Icons.phone, user['mobile']),
                                    _buildInfoRow(
                                        Icons.location_city, user['city']),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: Icon(
                                  widget.favoriteUsers.contains(user)
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: widget.favoriteUsers.contains(user)
                                      ? Colors.red
                                      : null,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (widget.favoriteUsers.contains(user)) {
                                      widget.favoriteUsers.remove(user);
                                    } else {
                                      widget.favoriteUsers.add(user);
                                    }
                                  });
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateUser(
                                        user: user,
                                        onUpdate: (updatedUser) {
                                          setState(() {
                                            widget.users[index] = updatedUser;
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  _showDeleteConfirmationDialog(
                                      context, user, index);
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.info, color: Colors.green),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserDetail(user: user)),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, Map<String, dynamic> user, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete User"),
          content: Text("Are you sure you want to delete ${user['fullName']}?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  widget.users.removeAt(index);
                  if (widget.favoriteUsers.contains(user)) {
                    widget.favoriteUsers.remove(user);
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
