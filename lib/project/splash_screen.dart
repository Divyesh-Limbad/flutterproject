import 'package:first/project/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(
        Duration(seconds: 3)); // Show splash screen for 3 seconds

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isUser LoggedIn') ?? false;

    // Navigate to the appropriate screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => isLoggedIn ? Homepage() : LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          // Add padding for better layout
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to Matrimonial App',
                textAlign: TextAlign.center, // Center the text
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Connecting hearts and souls',
                textAlign: TextAlign.center, // Center the text
                style: TextStyle(
                  fontSize: 16,
                  color:
                      Colors.white70, // Slightly lighter color for the subtitle
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
