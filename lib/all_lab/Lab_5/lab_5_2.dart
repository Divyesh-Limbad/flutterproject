// WAP to read 2 list and return list that contains only the elements that are common between
// them.

import 'dart:io';

void main() {
  List<int> list1 = [];
  for (int i = 0; i < 5; i++) {
    stdout.write("Enter the number $i = ");
    list1.add(int.parse(stdin.readLineSync()!));
  }

  List<int> list2 = [];
  for (int i = 0; i < 5; i++) {
    stdout.write("Enter the number $i = ");
    list2.add(int.parse(stdin.readLineSync()!));
  }
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      if (list1[i] == list2[j]) {
        stdout.write(list1[i] ,);
      }
    }
  }
}
