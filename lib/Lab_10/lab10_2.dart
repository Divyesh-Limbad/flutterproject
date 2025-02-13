import 'package:flutter/material.dart';

class ListViewBuilderDemo extends StatefulWidget {
  const ListViewBuilderDemo({super.key});

  @override
  State<ListViewBuilderDemo> createState() => _ListViewBuilderDemoState();
}

class _ListViewBuilderDemoState extends State<ListViewBuilderDemo> {
  List<String> l1 = ["a", "b", "c", "d", "e"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: ListView.builder(
          itemCount: l1.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 500,
              width: 200,
              decoration: BoxDecoration(border: Border.all()),
              child: Text(l1[index]),
            );
          }),
    );
  }
}
