//WAP program to calculate the sum of all positive even numbers and the sum of all negative
//odd numbers from a set of numbers. you can enter 0 (zero) to quit the program and thus it
//displays the result.

import 'dart:io';

void main(){
  List<int> l1 = [];

  int? a;
  int sump=0;
  int sumn=0;

  while(a!=0){
    a = int.parse(stdin.readLineSync()!);
    l1.add(a);

    if(a>0 && a%2==0){
      sump=a+sump;
    }
    else if(a<0 && a%2!=0){
      sumn=a+sumn;
    }
  }
  print("sum of all positive even numbers $sump" );
  print("sum of all negative odd numbers $sumn" );

}





