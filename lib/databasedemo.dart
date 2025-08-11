import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class SqfCrud extends StatefulWidget {
  const SqfCrud({super.key});

  @override
  State<SqfCrud> createState() => _SqfCrudState();
}

class _SqfCrudState extends State<SqfCrud> {
  late Database _database;
  List<Map<String, dynamic>> datalist = [];
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var idController = TextEditingController();

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'my_new_db'), // Changed database name here
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );
    _fetchData();
  }

  Future<void> _fetchData() async {
    final List<Map<String, dynamic>> data = await _database.query('todo');
    setState(() {
      datalist = data;
    });
  }

  Future<void> update(int id, String name, int age) async {
    await _database.update(
      'todo',
      {'name': name, 'age': age},
      where: 'id = ?',
      whereArgs: [id],
    );
    _fetchData();
  }

  Future<void> postData(String name, int age) async {
    await _database.insert(
      'todo',
      {'name': name, 'age': age},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _fetchData();
  }

  Future<void> delete(int id) async {
    await _database.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );
    _fetchData();
  }

  void showModalSheet(BuildContext context, {bool isUpdate = false, Map<String, dynamic>? item}) {
    if (isUpdate && item != null) {
      nameController.text = item['name'];
      ageController.text = item['age'].toString();
    }
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (isUpdate && item != null) {
                  await update(
                    item['id'],
                    nameController.text,
                    int.parse(ageController.text),
                  );
                } else {
                  await postData(
                    nameController.text.toString(),
                    int.parse(ageController.text),
                  );
                }
                nameController.clear();
                ageController.clear();
                Navigator.pop(context);
              },
              child: Text(isUpdate ? 'Update' : 'Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _initDatabase();
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqflite CRUD'),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showModalSheet(context);
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: datalist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(datalist[index]['name'][0]),
                    ),
                    title: Text(datalist[index]['name']),
                    subtitle: Text('Age: ${datalist[index]['age']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            showModalSheet(
                              context,
                              isUpdate: true,
                              item: datalist[index],
                            );
                          },
                          icon: Icon(Icons.edit),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () async {
                            await delete(datalist[index]['id']);
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}