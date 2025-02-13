import 'package:flutter/material.dart';

class Colour extends StatelessWidget {
  const Colour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application"),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.red,
                )),
                Expanded(
                    child: Container(
                  color: Colors.green,
                )),
                Expanded(
                    child: Container(
                  color: Colors.black,
                ))
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.pink,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.orange,
                    )),
                Expanded(
                    child: Container(
                  color: Colors.brown,
                ))
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.purple,
                )),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.lightBlue,
                    )),
                Expanded(
                    child: Container(
                  color: Colors.yellow,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
