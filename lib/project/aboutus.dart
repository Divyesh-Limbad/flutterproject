import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutusState();
}

class _AboutusState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF512DA8), // Deep Purple Shade
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF512DA8), Color(0xFF311B92)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Typing Tutor',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              _buildActionButton(
                  'Meet Our Team', Icons.people, Colors.redAccent, () {}),
              SizedBox(height: 20),
              _buildCombinedInfoCard(),
              SizedBox(height: 20),
              _buildActionButton(
                  'About ASWDC', Icons.info, Colors.orange, () {}),
              SizedBox(height: 20),
              _buildImageCard('assets/images/darshanlogo.png', [
                'ASWDC is Application, Software and Website Development Center @ Darshan University run by Students and Staff of School Of Computer Science.',
                'Sole purpose of ASWDC is to bridge gap between university curriculum & industry demands. Students learn cutting edge technologies, develop real world application & experiences professional environment @ ASWDC under guidance of industry experts & faculty members.',
              ]),
              SizedBox(height: 20),
              _buildActionButton(
                  'Contact Us', Icons.phone, Colors.green, () {}),
              SizedBox(height: 20),
              _buildContactCard([
                {'icon': Icons.email, 'text': 'aswdc@darshan.ac.in'},
                {'icon': Icons.phone, 'text': '+91-9727747317'},
                {'icon': Icons.language, 'text': 'www.darshan.ac.in'},
              ]),
              SizedBox(height: 20),
              _buildActionButton(
                  'Follow Us', Icons.share, Colors.blueAccent, () {}),
              SizedBox(height: 20),
              _buildContactCard([
                {'icon': Icons.share, 'text': 'Share App'},
                {'icon': Icons.apps, 'text': 'More Apps'},
                {'icon': Icons.star, 'text': 'Rate Us'},
                {'icon': Icons.thumb_up, 'text': 'Like us on Facebook'},
                {'icon': Icons.refresh, 'text': 'Check for Update'},
              ]),
              SizedBox(height: 30),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCombinedInfoCard() {
    return Card(
      color: Colors.deepPurple[100],
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(thickness: 1.2),
            _infoText('Developed by', 'Divyesh Limbad (23010101151)'),
            _infoText('Mentored by',
                'Prof. Mehul Bhundiya, School of Computer Science'),
            _infoText('Explored by', 'ASWDC, School of Computer Science'),
            _infoText(
                'Eulogized by', 'Darshan University, Rajkot, Gujarat - INDIA'),
          ],
        ),
      ),
    );
  }

  Widget _infoText(String title, String detail) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(
                text: '$title: ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: detail),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
      String text, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 26, color: Colors.white),
      label: Text(text,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
      ),
    );
  }

  Widget _buildImageCard(String imagePath, List<String> details) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(imagePath, height: 80),
            SizedBox(height: 10),
            ...details.map((detail) => Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(detail, style: TextStyle(fontSize: 16)),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(List<Map<String, dynamic>> contacts) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: contacts
              .map((contact) => Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Icon(contact['icon'], color: Colors.purple),
                        SizedBox(width: 10),
                        Text(contact['text'], style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Text(
          '© 2025 Darshan University',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          'All Rights Reserved - Privacy Policy',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Made with',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(width: 4),
            Icon(Icons.favorite, color: Colors.red, size: 20),
            SizedBox(width: 4),
            Text(
              'in India',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
