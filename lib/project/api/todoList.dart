import 'package:first/project/api/api.dart';
import 'package:first/project/api/const_api.dart';
import 'package:flutter/material.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  DemoApi api = DemoApi();
  bool isApiCall = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DemoApi().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Row(
                      children: [Text(snapshot.data![index][NAME])],
                    ),
                    subtitle: Row(
                      children: [
                        Text(snapshot.data![index][EMAIL]),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () async {
                            await api.deleteUser(
                                id: snapshot.data![index][ID],
                                context: context);
                            setState(() {});
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("No data"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
