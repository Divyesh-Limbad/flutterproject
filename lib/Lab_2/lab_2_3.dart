// WAP to find out largest number from given three numbers without using Logical Operator.
import 'dart:io';

void main(){

  int? n1,n2,n3,temp;
  stdout.write("Enter a number1 = ");
  n1 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter a number2 = ");
  n2 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter a number3 = ");
  n3 = int.parse(stdin.readLineSync()!);

  if(n1<n2){
    temp=n1;
    n1=n2;
    n2=temp;
  }
  if(n1<n3){
    temp=n1;
    n1=n3;
    n3=temp;
  }
  if(n2<n3){
    temp=n2;
    n2=n3;
    n3=temp;
  }
  stdout.write(" largest number is $n1 and second largest number is $n2 and small number is $n3");

}