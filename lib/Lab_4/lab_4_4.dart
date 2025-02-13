//WAP to accept a number and check whether the number is prime or not. Use method name
// check (int n). The method returns 1, if the number is prime otherwise, it returns 0.

import 'dart:io';
int check(int n){
  int count=1;

  for(int i=2; i<n; i++) {
    if (n % i == 0) {
      count++;
    }
  }
  if(count>2){
    return 0;
  }
  else{
    return 1;
  }
}
void main(){
  int? n;
  stdout.write("Enter the number = ");
  n = int.parse(stdin.readLineSync()!);

  check(n);
}