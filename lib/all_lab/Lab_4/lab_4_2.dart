//WAP to find maximum number from given two numbers using method.

import 'dart:io';
  void maxValue(int a, int b){
    if(a>b){
      print("Max is $a");
    }
    else{
      print("max is $b");
    }
  }
void main(){
  int? a;
  stdout.write("Enter a number1 = ");
  a = int.parse(stdin.readLineSync()!);
  int? b;
  stdout.write("Enter a number2 = ");
  b = int.parse(stdin.readLineSync()!);
  maxValue(a, b);
}