import 'package:first/project/AddUser.dart';
import 'package:first/project/favouriteuser.dart';
import 'package:flutter/material.dart';
import 'UserList.dart';
import 'aboutus.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, dynamic>> users = []; // List to hold user data
  List<Map<String, dynamic>> favoriteUsers = []; // List to hold favorite users

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
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              _buildDashboardButton(context, 'Add User', Icons.person_add,
                  AddUser(), Colors.redAccent),
              _buildDashboardButton(
                  context,
                  'User List',
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
    );
  }

  Widget _buildDashboardButton(BuildContext context, String title,
      IconData icon, Widget route, Color color,
      {bool direct = false}) {
    return Container(
      decoration: BoxDecoration(
        color: color, // Set unique background color
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Card(
        color: Colors.transparent, // Make card background transparent
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(color: Colors.grey.shade300),
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
                    users
                        .addAll(newUsers); // Add new users to the existing list
                  });
                }
              });
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50.0, color: Colors.white),
              SizedBox(height: 10.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color to contrast background
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
