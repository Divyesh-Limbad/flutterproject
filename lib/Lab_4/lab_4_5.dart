// WAP to count number of even or odd number from an array of n numbers.

import 'dart:io';

void countArray(List<int> n){
  int even=0;
  int odd=0;

  for(int i=0; i<=n.length-1; i++){
    if(n[i]%2==0){
      even++;
    }
    else{
      odd++;
    }
  }
  print("Even number is = $even");
  print("Odd number is = $odd");

}
void main(){

  List<int> listint =[];
  int? n;
  stdout.write("Enter the size = ");
  n = int.parse(stdin.readLineSync()!);

  for(int i=0; i<n;i++){
    stdout.write("Enter the number $i = ");
    listint.add( int.parse(stdin.readLineSync()!));
  }

  countArray(listint);
}