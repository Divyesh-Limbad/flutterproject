// WAP to read marks of five subjects. Calculate percentage and print class accordingly. Fail
// below 35, Pass Class between 35 to 45, Second Class between 45 to 60, First Class between 60
// to 70, Distinction if more than 70.
import 'dart:io';

void main(){
    int? a,b,c,d,e;

    stdout.write("Enter a mark of maths: ");
    a = int.parse(stdin.readLineSync()!);

    stdout.write("Enter a mark of science: ");
    b = int.parse(stdin.readLineSync()!);

    stdout.write("Enter a mark of english: ");
    c = int.parse(stdin.readLineSync()!);

    stdout.write("Enter a value of hindi: ");
    d = int.parse(stdin.readLineSync()!);

    stdout.write("Enter a value of computer: ");
    e = int.parse(stdin.readLineSync()!);

    double per = ((a+b+c+d+e)*100)/500;

    if(per<35){
        print("Fail");
    }
    if(per>=35 && per<45 ){
        print("Pass");
    }
    if(per>=45 && per<60 ){
        print("Second class");
    }
    if(per>=60 && per<70){
        print("First class");
    }
    if(per>=70){
        print("Distintion");
    }
}