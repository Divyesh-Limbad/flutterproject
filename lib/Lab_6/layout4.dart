import 'package:flutter/material.dart';

class Layout4 extends StatelessWidget {
  const Layout4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.orange,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.white,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.green,
                  ))
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.orangeAccent,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.white38,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.lightGreenAccent,
                  ))
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.black,
                      )),
                  Expanded(
                      child: Container(
                    color: Colors.red,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.deepPurple,
                  ))
                ],
              ))
            ],
          )),
          Expanded(
              child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.red,
                      )),
                  Expanded(
                      child: Container(
                    color: Colors.purple,
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.brown,
                      ))
                ],
              )),
              Expanded(
                  child: Row(
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
                      flex: 2,
                      child: Container(
                        color: Colors.black,
                      )),
                  Expanded(
                      child: Container(
                    color: Colors.yellow,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.blueAccent,
                  ))
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.white,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.deepOrangeAccent,
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.pink,
                      ))
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.green,
                      )),
                  Expanded(
                      child: Container(
                    color: Colors.lightBlueAccent,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.lightGreenAccent,
                  ))
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.orange,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.white,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.deepPurpleAccent,
                  ))
                ],
              ))
            ],
          ))
        ],
      ),
    );
  }
}
