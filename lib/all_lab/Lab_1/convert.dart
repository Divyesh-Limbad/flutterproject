// WAP that reads a number in meters, converts it to feet, and display the result.
import 'dart:io';

void main (){
  int? meter;

  stdout.write("Enter meter = ");
  meter = int.parse(stdin.readLineSync()!);

  double result = meter*3.28;

  print("feet is $result");
}