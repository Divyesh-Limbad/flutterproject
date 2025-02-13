import 'package:flutter/material.dart';

class Bottomnavinewbar extends StatefulWidget {
  const Bottomnavinewbar({super.key});

  @override
  State<Bottomnavinewbar> createState() => _BottomnavinewbarState();
}

class _BottomnavinewbarState extends State<Bottomnavinewbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showBottomSheet(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("jaja"),
                  );
                },
              );
            },
            child: Text("heook")),
      ),
    );
  }
}
