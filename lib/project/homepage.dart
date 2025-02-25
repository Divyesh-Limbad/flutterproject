import 'package:first/project/addUser.dart';
import 'package:first/project/UserList.dart';
import 'package:first/project/addUser.dart';
import 'package:first/project/favouriteuser.dart';
import 'package:flutter/material.dart';
import 'UserList.dart';
import 'aboutus.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> users = [];
  List<Map<String, dynamic>> favoriteUsers = [];

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
                    Favourite(favoriteUsers: favoriteUsers), Colors.orange),
                _buildDashboardButton(
                    context, 'About Us', Icons.info, AboutUs(), Colors.purple,
                    direct: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardButton(BuildContext context, String title,
      IconData icon, Widget route, Color color,
      {bool direct = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding here
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
