// WAP to find whether the given number is prime or not.

import 'dart:io';

void main(){
  int? n;
  stdout.write("Enter a number = ");
  n = int.parse(stdin.readLineSync()!);
  int count=1;

  for(int i=2; i<n; i++) {
    if (n % i == 0) {
      count++;
    }
  }
    if(count>2){
      print("not prime number");
    }
    else{
      print("prime number");
    }
}