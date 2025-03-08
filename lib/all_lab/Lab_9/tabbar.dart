import 'package:flutter/material.dart';

class Tabbaruse extends StatelessWidget {
  const Tabbaruse({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("TabbarUse"),
            bottom: TabBar(tabs: [
              Tab(text: "tab1"),
              Tab(text: "tab2"),
              Tab(text: "tab3"),
            ]),
          ),
          body: TabBarView(children: [
            Center(
                child: Text(
              "First page",
              style: TextStyle(
                color: Colors.red,
              ),
            )),
            Center(
                child: Text(
              "Second page",
              style: TextStyle(
                color: Colors.green,
              ),
            )),
            Center(
                child: Text(
              "Third page",
              style: TextStyle(
                color: Colors.yellow,
              ),
            )),
          ]),
        ));
  }
}
