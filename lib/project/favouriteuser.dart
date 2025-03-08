import 'package:first/project/Updateuser.dart';
import 'package:first/project/aboutus.dart';
import 'package:first/project/database/database_helper.dart';
import 'package:first/project/homepage.dart';
import 'package:first/project/userdetail.dart';
import 'package:first/project/userlist.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Map<String, dynamic>> favoriteUsers = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadFavoriteUsers();
  }

  int _selectedIndex = 2; // Default to Favorite Page

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } else if (index == 1) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => UserList(users: [], favoriteUsers: [])));
    } else if (index == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Favourite()));
    } else if (index == 3) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AboutUs()));
    }
  }

  Future<void> _loadFavoriteUsers() async {
    final dbHelper = DatabaseHelper();
    List<Map<String, dynamic>> users = await dbHelper.getFavoriteUsers();

    setState(() {
      favoriteUsers = users;
    });
  }

  Future<void> _toggleFavorite(Map<String, dynamic> user) async {
    final dbHelper = DatabaseHelper();
    bool isCurrentlyFavorite = user['favorite'] == 1;

    await dbHelper.toggleFavorite(user['id'], !isCurrentlyFavorite);

    _loadFavoriteUsers(); // Refresh the favorite users list
  }

  @override
  Widget build(BuildContext context) {
    final filteredUsers = favoriteUsers.where((user) {
      return user['fullName'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Users'),
        backgroundColor: Colors.pink,
        centerTitle: true,
        elevation: 5,
      ),
      backgroundColor: Colors.pink[50],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Users',
                prefixIcon: const Icon(Icons.search, color: Colors.pink),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: filteredUsers.isEmpty
                ? const Center(
                    child: Text(
                      'No favorite users found!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = filteredUsers[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
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
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 1),
                                _buildInfoRow(Icons.female, user['gender']),
                                _buildInfoRow(
                                    Icons.location_city, user['city']),
                                const SizedBox(height: 1),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        user['favorite'] == 1
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => _toggleFavorite(user),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.blue),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => UpdateUser(
                                              user: user,
                                              onUpdate: (updatedUser) {
                                                setState(() {
                                                  favoriteUsers[index] =
                                                      updatedUser;
                                                });
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () {
                                        _showDeleteConfirmationDialog(
                                            context, user, index);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.info,
                                          color: Colors.green),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        // <-- This works for fixed
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Homepage'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Userlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'AboutUs'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
              onPressed: () async {
                final dbHelper = DatabaseHelper();
                await dbHelper.deleteUser(user['id']);

                _loadFavoriteUsers(); // Refresh UI
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
