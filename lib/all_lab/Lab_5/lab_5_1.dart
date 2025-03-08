// WAP that prompts the user to enter 5 numbers, stores them in a List, and displays them in
// increasing order.
import 'dart:io';
void main(){
  List<int> listint =[];
  for(int i=0; i<5;i++){
    stdout.write("Enter the number $i = ");
    listint.add( int.parse(stdin.readLineSync()!));
  }
  listint.sort();
  print("Sorted list is : $listint");
}