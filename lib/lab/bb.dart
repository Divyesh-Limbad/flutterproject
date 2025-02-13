import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Crud2 extends StatefulWidget {
  const Crud2({super.key});

  @override
  State<Crud2> createState() => _Crud2State();
}

class _Crud2State extends State<Crud2> {
  List<String> names = ['Apple', 'Banana', 'Watermelon'];
  List<String> filterName = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  int? selectedIndex;

  void addUser(String data) {
    setState(() {
      names.add(data);
    });
    nameController.clear();
  }

  void editUser(int index, String data) {
    setState(() {
      names[index] = data;
    });
    nameController.clear();
    selectedIndex = null; // Clear the selected index after update
  }

  void deleteUser(int index) {
    setState(() {
      names.removeAt(index);
    });
  }

  void searchNames(String data) {
    setState(() {
      data = data.toLowerCase().toString();

      filterName = names.where((value) {
        return value.toLowerCase().contains(data);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Center(child: Text('CRUD', style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: 'Enter name',
            ),
          ),
          SizedBox(height: 20), // Adjusted space

          ElevatedButton(
            onPressed: () {
              if (selectedIndex == null) {
                // Add new user
                addUser(nameController.text);
              } else {
                // Update existing user
                editUser(selectedIndex!, nameController.text);
              }
            },
            child: Text(
              selectedIndex == null ? 'Add user' : 'Update user',
              style: TextStyle(
                fontSize: 16, // Font size
                fontWeight: FontWeight.bold, // Make text bold
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
            ),
          ),

          SizedBox(height: 20), // Adjusted space

          TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Search here for user',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => searchNames(value)),
          SizedBox(height: 20), // Adjusted space

          Expanded(
            child: ListView.builder(
              itemCount: searchController.text.isEmpty
                  ? names.length
                  : filterName.length,
              itemBuilder: (context, index) {
                String displayName = searchController.text.isEmpty
                    ? names[index]
                    : filterName[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(displayName),
                      IconButton(
                        onPressed: () {
                          nameController.text = displayName;
                          setState(() {
                            selectedIndex = names.indexOf(
                                displayName); // Set the index for edit mode
                          });
                        },
                        icon: Icon(CupertinoIcons.pencil),
                      ),
                      IconButton(
                        onPressed: () {
                          int deleteIndex = names.indexOf(displayName);
                          deleteUser(index);
                        },
                        icon: Icon(CupertinoIcons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
