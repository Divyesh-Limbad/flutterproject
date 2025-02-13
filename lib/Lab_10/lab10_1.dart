import 'package:flutter/material.dart';

class ViewTabUse extends StatefulWidget {
  const ViewTabUse({super.key});

  @override
  State<ViewTabUse> createState() => _ViewTabUseState();
}

class _ViewTabUseState extends State<ViewTabUse> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          color: Colors.red,
          height: 500,
          width: 200,
        ),
        Container(
          color: Colors.blue,
          height: 500,
          width: 200,
        ),
        Container(
          color: Colors.yellow,
          height: 500,
          width: 200,
        ),
        Container(
          color: Colors.lightGreen,
          height: 500,
          width: 200,
        ),
      ],
    );
  }
}
