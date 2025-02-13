import 'package:flutter/material.dart';

class Navigationbaruse extends StatelessWidget {
  const Navigationbaruse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ActionbarUse"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text("Alert Dialogue"),
                          content: Text(" clicked here"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("ok"))
                          ]);
                    });
              },
              icon: Icon(Icons.more_vert))
        ],
      ),
      body: Center(
        child: Text(
          "Tap three dot ",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
