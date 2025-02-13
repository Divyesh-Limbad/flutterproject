import 'package:first/finalproject/addedituserscreen.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  final List<Map<String, dynamic>> userList;

  const UserListScreen({Key? key, required this.userList}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  void _deleteUser(int index) {
    // Show confirmation dialog before deleting user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure you want to delete this user?'),
          actions: [
            // No button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('No'),
            ),
            // Yes button
            TextButton(
              onPressed: () {
                setState(() {
                  widget.userList.removeAt(index); // Delete the user
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void _toggleFavorite(int index) {
    setState(() {
      widget.userList[index]['isFavorite'] =
          !(widget.userList[index]['isFavorite'] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User List')),
      body: widget.userList.isEmpty
          ? const Center(child: Text('No users available.'))
          : ListView.builder(
              itemCount: widget.userList.length,
              itemBuilder: (context, index) {
                final user = widget.userList[index];
                final age = _calculateAge(user['dob']);

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12.0),
                    title: Text(
                      user['fullName'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('City: ${user['city']}'),
                        Text('Email: ${user['email']}'),
                        Text('Mobile: ${user['mobileNumber']}'),
                        Text('DOB: ${user['dob']}'),
                        Text('Gender: ${user['gender']}'),
                        Text('Age: $age years'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            user['isFavorite'] == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: () => _toggleFavorite(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            // Navigate to AddEditUserScreen for editing
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddEditUserScreen(
                                  onUserAdded: (updatedUser) {
                                    setState(() {
                                      widget.userList[index] = updatedUser;
                                    });
                                  },
                                  existingUser: user,
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteUser(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  int _calculateAge(String dob) {
    final parts = dob.split('/');
    if (parts.length != 3) return 0;

    final birthDate = DateTime(
      int.parse(parts[2]),
      int.parse(parts[1]),
      int.parse(parts[0]),
    );

    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }
}
