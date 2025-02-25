import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserDetail extends StatelessWidget {
  final Map<String, dynamic> user;

  UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light background
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Profile Avatar
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      user['fullName'][0].toUpperCase(),
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    user['fullName'],
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  Divider(thickness: 1, color: Colors.grey[300]),

                  // User Details
                  _buildInfoRow(Icons.email, "Email", user['email']),
                  _buildInfoRow(Icons.phone, "Mobile", user['mobile']),
                  _buildInfoRow(Icons.location_city, "City", user['city']),
                  _buildInfoRow(Icons.person, "Gender", user['gender']),
                  _buildInfoRow(Icons.cake, "DOB", user['dob']),
                  _buildInfoRow(Icons.accessibility_new, "Age",
                      "${_calculateAge(user['dob'])} years"),
                  _buildInfoRow(Icons.favorite, "Hobbies", user['hobbies']),

                  SizedBox(height: 20),

                  // Back Button
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    label: Text("Back", style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 24),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "$title: $value",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
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
}
