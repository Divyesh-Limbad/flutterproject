import 'package:flutter/material.dart';

class Layout2 extends StatelessWidget {
  const Layout2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(flex: 3, child: Container(color: Colors.brown)),
              Expanded(child: Container(color: Colors.cyan))
            ],
          )),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.white,
                  )),
                  Expanded(
                      child: Column(children: [
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          color: Colors.amberAccent,
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.red,
                        ))
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          color: Colors.black,
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.blueGrey,
                        ))
                      ],
                    ))
                  ])),
                  Expanded(
                      child: Container(
                    color: Colors.purple,
                  ))
                ],
              )),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.black,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.white,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.black,
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.white,
                  ))
                ],
              )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Column(children: [
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.amberAccent,
                    )),
                    Expanded(
                        child: Column(children: [
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.white,
                          )),
                          Expanded(
                              child: Container(
                            color: Colors.red,
                          ))
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.black,
                          )),
                          Expanded(
                              child: Container(
                            color: Colors.blueGrey,
                          ))
                        ],
                      ))
                    ]))
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.black,
                    )),
                    Expanded(
                        child: Container(
                      color: Colors.blueGrey,
                    ))
                  ],
                ))
              ])),
              Expanded(
                  child: Container(
                color: Colors.pinkAccent,
              )),
              Expanded(
                  child: Column(children: [
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.amberAccent,
                    )),
                    Expanded(
                        child: Column(children: [
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.white10,
                          )),
                          Expanded(
                              child: Container(
                            color: Colors.red,
                          ))
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.black,
                          )),
                          Expanded(
                              child: Container(
                            color: Colors.blueGrey,
                          ))
                        ],
                      ))
                    ]))
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.black,
                    )),
                    Expanded(
                        child: Container(
                      color: Colors.blueGrey,
                    ))
                  ],
                ))
              ]))
            ],
          ))
        ],
      ),
    );
  }
}
