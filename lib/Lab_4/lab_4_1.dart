// WAP to calculate simple interest using method.

import 'dart:io';

void interest(int p, int t, int r){
  double ans=(p*t*r)/100;
  print("interest is $ans");
}
void main(){
  int? p,t,r;
  stdout.write("Enter a number p = ");
  p = int.parse(stdin.readLineSync()!);

  stdout.write("Enter a number r= ");
  t = int.parse(stdin.readLineSync()!);

  stdout.write("Enter a number n= ");
  r = int.parse(stdin.readLineSync()!);
  interest(p,t,r);
}