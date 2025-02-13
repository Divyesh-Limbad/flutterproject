// WAP to make a Simple Calculator using switch...case

import 'dart:io';

void main(){

    stdout.write("Enter a first number = ");
    double a = double.parse(stdin.readLineSync()!);

    stdout.write("Enter a '+','-','*','/' = ");
    String operator = stdin.readLineSync()!;

    stdout.write("Enter a second number = ");
    double b = double.parse(stdin.readLineSync()!);

    double result;

    switch(operator){
      case '+':
        result = a + b ;
        print("Result: $result");
        break;

      case '-':
        result = a - b;
        print("Result: $result");
        break;

      case '*':
        result = a * b ;
        print("Result: $result");
        break;

      case '/':
        if (b != 0) {
          result = (a / b);
          print("Result: $result");
        } else {
          print("Error: Division by zero is not allowed.");
        }
        break;

      default:
        print("Invalid operator..");

    }
}