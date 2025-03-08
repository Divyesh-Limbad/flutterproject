// WAP to perform Addition, Subtraction, Multiplication, Division based on user choice using if,
// if..else..if, & switch.
import 'dart:io';

void main(){

  int? n1,n2,ans;

  stdout.write("enter number1 = ");
  n1 = int.parse(stdin.readLineSync()!);

  stdout.write("enter number2 = ");
  n2 = int.parse(stdin.readLineSync()!);

  String? fun;
  stdout.write("enter function = ");
  fun = stdin.readLineSync();


  if(fun=='+'){
    ans = n1 + n2;
    stdout.write("Sum = $ans");
  }
  if(fun=='-'){
    ans = n1 - n2;
    stdout.write("Min = $ans");
  }
  if(fun=='*'){
    ans = n1 * n2;
    stdout.write("malti = $ans");
  }
  if(fun=='/'){

    if(n2 == 0){
      stdout.write("not valid");
      return;
    }
    double ans = n1 / n2;
    stdout.write("divion = $ans");
  }

}