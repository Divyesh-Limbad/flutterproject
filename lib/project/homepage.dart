import 'package:first/project/userlist.dart';
import 'package:first/project/adduser.dart';
import 'package:first/project/favouriteuser.dart';
import 'package:first/project/login/login_page.dart';
import 'package:flutter/material.dart';
import 'aboutus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> users = [];
  List<Map<String, dynamic>> favoriteUsers = [];

  int _selectedIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Matrimonial Dashboard',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.pinkAccent,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool(
                    'isUser  LoggedIn', false); // Clear login status
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.pinkAccent.shade200, Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                _buildDashboardButton(context, 'Add User', Icons.person_add,
                    AddUser(), Colors.redAccent),
                _buildDashboardButton(
                    context,
                    'User  List',
                    Icons.list,
                    UserList(users: users, favoriteUsers: favoriteUsers),
                    Colors.green),
                _buildDashboardButton(context, 'Favorite', Icons.favorite,
                    Favourite(), Colors.orange),
                _buildDashboardButton(
                    context, 'About Us', Icons.info, AboutUs(), Colors.purple,
                    direct: true),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          // <-- This works for fixed
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Homepage'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Userlist'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'AboutUs'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildDashboardButton(BuildContext context, String title,
      IconData icon, Widget route, Color color,
      {bool direct = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: InkWell(
            onTap: () {
              if (direct) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AboutUs()));
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => route),
                ).then((newUsers) {
                  if (newUsers != null) {
                    setState(() {
                      users.addAll(newUsers);
                    });
                  }
                });
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50.0, color: color),
                SizedBox(height: 10.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
