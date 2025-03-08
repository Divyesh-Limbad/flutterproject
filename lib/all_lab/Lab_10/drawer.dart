import 'package:flutter/material.dart';

class DrawerDemoUse extends StatefulWidget {
  const DrawerDemoUse({super.key});

  @override
  State<DrawerDemoUse> createState() => _DrawerDemoUseState();
}

class _DrawerDemoUseState extends State<DrawerDemoUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DRAWER PAGE'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'Navigation Drawer Demo',
          style: TextStyle(fontSize: 20),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [

            ListTile(
              leading: Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: const Text(' My Name '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),


          ],
        ),
      ),
    );
  }
}
