import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Allview extends StatefulWidget {
  Allview({super.key});

  @override
  State<Allview> createState() => _AllviewState();
}

class _AllviewState extends State<Allview> {
  DateTime current = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab11&12"),
      ),
      body: GridView.builder(
        itemCount: 12,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.green,
            child: Center(
              child: Text(DateFormat("dd-MMM-yyyy").format(current)),
            ),
          );
        },
      ),
    );
  }
}
