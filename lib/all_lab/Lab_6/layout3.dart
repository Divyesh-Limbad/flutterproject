import 'package:flutter/material.dart';

class Layout3 extends StatelessWidget {
  const Layout3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Layout",
          style: TextStyle(color: Colors.red, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.redAccent,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.blue,
                          )),
                          Expanded(
                              child: Container(
                            color: Colors.purple,
                          ))
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.brown,
                          )),
                          Expanded(
                              child: Container(
                            color: Colors.yellowAccent,
                          ))
                        ],
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.grey,
                )),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.deepPurple,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.lightGreenAccent,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.yellow,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.pink,
                            ),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              color: Colors.orange,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  color: Colors.yellow,
                ))
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.yellowAccent,
                )),
                Expanded(
                    child: Container(
                  color: Colors.lightBlue,
                )),
                Expanded(
                    child: Container(
                  color: Colors.lime,
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
