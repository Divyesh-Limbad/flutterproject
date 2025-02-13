// WAP to print reverse string.

import 'dart:io';

void main() {
  stdout.write("Enter a string: ");
  String input = stdin.readLineSync()!;

  // Reversing the string
  String reversed = input.split('').reversed.join('');

  print("Reversed string: $reversed");
}
