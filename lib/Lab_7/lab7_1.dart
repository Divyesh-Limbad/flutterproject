import 'package:flutter/material.dart';

class FromDemo extends StatelessWidget {
  FromDemo({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Phone = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FormDemo", textAlign: TextAlign.center),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Image.asset('assets/images/BirthdayCake.png'),
            TextFormField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Enter name ",
                  labelText: "Enter name",
                  labelStyle: TextStyle(color: Colors.red),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Valid Name';
                  }
                  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return 'Enter Valid Name ';
                  }
                }),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: Email,
                decoration: InputDecoration(
                  hintText: "Enter Email ",
                  labelText: "Enter Email",
                  labelStyle: TextStyle(color: Colors.red),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Valid Email ';
                  }
                  if (!RegExp(
                          r'^[a-zA-Z0-9._%+]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                      .hasMatch(value)) {
                    return 'Enter Valid Email ';
                  }
                  return null;
                }
                ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                style: TextStyle(fontSize: 15),
                controller: Phone,
                decoration: InputDecoration(
                  hintText: "Enter Mobile number ",
                  labelText: "Enter Mobile number",
                  labelStyle: TextStyle(color: Colors.red),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Valid Mobile number';
                  }
                  if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
                    return 'Enter Valid Mobile number ';
                  }
                }),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () => {
                      if (formkey.currentState!.validate())
                        {print(name.text), print(Email.text), print(Phone.text)}
                    },
                child: Text("Submit")),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
