import 'package:first/project/AddUser.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'UpdateUser.dart';
import 'userdetail.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final newUsers = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddUser()),
              );

              if (newUsers != null && newUsers is List<Map<String, dynamic>>) {
                setState(() {
                  widget.users.addAll(newUsers);
                });
              }
            },
          ),
        ],
      ),
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
                int age = _calculateAge(user['dob']);

                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile Row
                        Row(
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
                              child: Text(
                                user['fullName'],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        // User Detai
                        _buildInfoRow(Icons.email, user['email']),
                        _buildInfoRow(Icons.phone, user['mobile']),
                        _buildInfoRow(Icons.location_city, user['city']),
                        const SizedBox(height: 10),

                        // Action Icons Row
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
                              icon: const Icon(Icons.edit, color: Colors.blue),
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
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                _showDeleteConfirmationDialog(
                                    context, user, index);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.info, color: Colors.green),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  int _calculateAge(String dob) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    DateTime birthDate = dateFormat.parse(dob);
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
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
          const SizedBox(width: 8),
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
