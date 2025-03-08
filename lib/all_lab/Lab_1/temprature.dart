// WAP to convert temperature from Fahrenheit to Celsius.
import 'dart:io';

void main(){

  int? f;
  stdout.write("Enter fahrenit = ");
  f = int.parse(stdin.readLineSync()!);

  double c = (f-32)*(5/9);

  print("celsius  is $c");
}