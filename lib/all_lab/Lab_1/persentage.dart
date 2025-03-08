// WAP to find percentage of 5 subject.

import 'dart:io';

void main(){
  int? a,b,c,d,e;

  stdout.write("Enter a mark of maths: ");
  a = int.parse(stdin.readLineSync()!);

  stdout.write("Enter a mark of science: ");
  b = int.parse(stdin.readLineSync()!);

  stdout.write("Enter a mark of english: ");
  c = int.parse(stdin.readLineSync()!);

  stdout.write("Enter a value of hindi: ");
  d = int.parse(stdin.readLineSync()!);

  stdout.write("Enter a value of computer: ");
  e = int.parse(stdin.readLineSync()!);

  double per = ((a+b+c+d+e)*100)/500;

  print("persentage $per%");
}