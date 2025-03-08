import 'package:first/project/UserList.dart';
import 'package:first/project/aboutus.dart';
import 'package:first/project/api/todoList.dart';
import 'package:first/project/database/database_helper.dart';
import 'package:first/project/favouriteuser.dart';
import 'package:first/project/homepage.dart';
import 'package:first/project/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // Ensure binding is initialized
//   await DatabaseHelper().database; // Initialize the database
//   runApp(MyApp());
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Management',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: SplashScreen(),
    );
  }
}
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;
//   final List<Widget> _pages = [
//     Homepage(),
//     UserList(users: [], favoriteUsers: []),
//     Favourite(),
//     AboutUs()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Homepage'),
//           BottomNavigationBarItem(icon: Icon(Icons.list), label: 'UserList'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite), label: 'Favorites'),
//           BottomNavigationBarItem(icon: Icon(Icons.info), label: 'AboutUs'),
//         ],
//       ),
//     );
//   }
// }
