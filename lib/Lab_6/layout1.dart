import 'package:flutter/material.dart';

class Layout1 extends StatelessWidget {
  const Layout1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.black,
              )),
              Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.red,
                          )),
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.yellow,
                          )),
                          Expanded(
                              child: Container(
                            color: Colors.white12,
                          ))
                        ],
                      )),
                    ],
                  )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.lightBlue,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.cyan,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.greenAccent,
                  )),
                ],
              )),
            ],
          ))
        ],
      ),
    );
  }
}
