import 'package:flutter/material.dart';
class User {
  String name;
  String password;
  User({required this.name,required this.password});

}

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  List<User> users=List.empty(growable:true);
  int selectedIndex =-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( centerTitle: true, title: Text('Crud'),backgroundColor: Colors.red,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  String name = nameController.text.trim();
                  String password = passController.text.trim();
                  if(name.isNotEmpty && password.isNotEmpty) {
                    setState(() {
                      nameController.text="";
                      passController.text='';
                      users.add(User(name: name, password: password));
                    });
                  }
                }, child: Text("Save")),
                ElevatedButton(onPressed: () {
                  String name = nameController.text.trim();
                  String password = passController.text.trim();
                  if(name.isNotEmpty && password.isNotEmpty) {
                    setState(() {
                      nameController.text="";
                      passController.text='';
                      users[selectedIndex].name=name;
                      users[selectedIndex].password=password;
                      selectedIndex=-1;
                    });
                  }

                }, child: Text("Update"))
              ],
            ),
            SizedBox(height: 30,),
            users.isEmpty? Text("List is Empty ...",style: TextStyle(fontSize: 22),):
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) => getRow(index),),
            )
          ],
        ),
      ),

    );
  }
  Widget getRow(int index){
    return Card(
      child: ListTile(
        title: Column(
          children: [
            Text(users[index].name),
            Text(users[index].password),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    nameController.text=users[index].name;
                    passController.text=users[index].password;
                    setState(() {
                      selectedIndex=index;
                    });
                  },
                  child: Icon(Icons.edit)),
              SizedBox(width: 10,),
              InkWell(
                  onTap: () {
                    setState(() {
                      users.removeAt(index);
                    });
                  },
                  child: Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}