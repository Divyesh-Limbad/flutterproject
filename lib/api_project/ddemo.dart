import 'package:first/api_project/dddemo.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ApiService api = ApiService();
  List<dynamic> users = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    var data = await api.getAllUsers();
    setState(() {
      users = data;
    });
  }

  Future<void> addUser() async {
    if (nameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      await api.addUser(
          {"name": nameController.text, "password": passwordController.text});
      nameController.clear();
      passwordController.clear();
      fetchUsers();
    }
  }

  Future<void> editUser(String id, String name, String password) async {
    nameController.text = name;
    passwordController.text = password;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit User"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name")),
            TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await api.editUser(id, {
                "name": nameController.text,
                "password": passwordController.text
              });
              Navigator.pop(context);
              fetchUsers();
            },
            child: Text("Update"),
          ),
        ],
      ),
    );
  }

  Future<void> deleteUser(String id) async {
    await api.deleteUser(id);
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User List")),
      body: Column(
        children: [
          // Add User Form (Instead of FloatingActionButton)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: addUser,
                  child: Text("Add User"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                var user = users[index];
                return ListTile(
                  title: Text(user['name']),
                  subtitle: Text("Password: ${user['password']}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => editUser(
                            user['id'], user['name'], user['password']),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteUser(user['id']),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
