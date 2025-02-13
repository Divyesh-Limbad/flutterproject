// WAP to accept n numbers in an array. Display the sum of all the numbers which are divisible
// by either 3 or 5.

import 'dart:io';

void main(){

  stdout.write('enter a number of array::');
  int n = int.parse(stdin.readLineSync()!);

  List<int> l1 = [n];


  for(int i=0;i<n;i++){
    stdout.write('enter a num ::');
    l1.add(int.parse(stdin.readLineSync()!));
  }

  int sum = 0;
  for (int i = 0 ; i < n ; i++){
    if(l1[i]%2 == 0){
      if(l1[i]%3==0){
        sum = sum + l1[i];
      }
    }
  }
  print(sum);
}