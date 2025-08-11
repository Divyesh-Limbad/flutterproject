// WAP to find whether the given number is prime or not.

import 'dart:io';

void main() {
  int? n;
  stdout.write("Enter a number = ");
  n = int.parse(stdin.readLineSync()!);
  int count = 0;

  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      count++;
    }
  }

  if (count == 2) {
    print("prime number");
  } else {
    print("not prime number");
  }
}
