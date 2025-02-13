// WAP to find factorial of the given number.
import 'dart:io';

void main(){
  int? n;
  stdout.write("Enter a number = ");
  n = int.parse(stdin.readLineSync()!);
  int ans=1;
  if(n==0 || n==1){
    print("answer = 1 ");
  }
  for(int i=n ; i!=0 ; i--){
       ans = ans*i;
  }
  print("answer is $ans");
}