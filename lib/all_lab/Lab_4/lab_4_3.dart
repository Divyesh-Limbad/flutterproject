// WAP to generate Fibonacci series of N given number using method.

import 'dart:io';

void fibonacci(int n){
  int first = 0;
  int second = 1;
  stdout.write("0, 1");

  for(int i=2; i<n; i++){
    int sum = first + second;
    stdout.write(", $sum");
    first=second;
    second=sum;
  }
  print("");
}

void main() {
  stdout.write("Enter the number of terms: ");
  int n = int.parse(stdin.readLineSync()!);

  if (n < 1) {
    print("Please enter a number greater than 0.");
  } else {
    print("Fibonacci Series:");
    fibonacci(n);
  }
}
