import 'package:first/all_lab/Lab_13/bottomnavinewbar.dart';
import 'package:flutter/material.dart';

class Bottomnavigationbaruse extends StatefulWidget {
  const Bottomnavigationbaruse({super.key});

  @override
  State<Bottomnavigationbaruse> createState() => _BottomnavigationbaruseState();
}

class _BottomnavigationbaruseState extends State<Bottomnavigationbaruse> {
  int index = 0;

  List<Widget> list = <Widget>[
    Center(
      child: Text(
        "Hello",
        style: TextStyle(fontSize: 20),
      ),
    ),
    Bottomnavinewbar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "First"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Second"),
        ],
      ),
    );
  }
}
