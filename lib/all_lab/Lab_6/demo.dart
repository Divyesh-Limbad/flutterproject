import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application"),
      ),
      body: const Text("this is App",
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 25.25,
          )),
      backgroundColor: Colors.black,
    );
  }
}

// class Demo extends StatelessWidget {
//   const Demo({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("hello"),
//       ),
//       body: Text("bodydata", style: TextStyle(color: Colors.red ,fontSize: 100.60)),
//     );
//   }
// }

//