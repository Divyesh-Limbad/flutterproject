//Body Mass Index (BMI) is measure of health on weight. It can be calculated by taking your
// weight in kilograms and dividing by square of your height in meters. Write a program that
// prompts the user to enter a weight in pounds and height in inches and display the BMI.
// Note: 1 pound=.45359237 Kg and 1 inch=0.0254 meters.

import 'dart:io';

void main(){
  int? a,b;

  stdout.write("Enter weight in pounds :");
  a = int.parse(stdin.readLineSync()!);

  stdout.write("Enter height in pounds :");
  b = int.parse(stdin.readLineSync()!);

  double weight = a*0.45359237;
  double height=b*0.0254;

  double bmi=weight /(height*height);

  print("BMI is $bmi");

}