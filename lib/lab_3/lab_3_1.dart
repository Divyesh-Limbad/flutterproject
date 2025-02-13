// WAP to print numbers between two given numbers which is divisible by 2 but not divisible by 3.
import 'dart:io';

void main(){
  int? a;
  stdout.write("Enter a number first = ");
  a = int.parse(stdin.readLineSync()!);

  int? b;
  stdout.write("Enter a number last = ");
  b = int.parse(stdin.readLineSync()!);

  for(int i = a ; i < b; i++){
    if(i%2==0 && i%3!=0){
      print("$i");
    }
  }
}