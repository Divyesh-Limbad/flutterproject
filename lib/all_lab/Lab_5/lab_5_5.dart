// WAP to find friends detail by their name using dictionary. (Create local dictionary and search
// from it using Map<String,Object?> & Model Class).

import 'dart:io';

void main(){
  Map<String ,Object> mapp={
    "sagar":Friends(age: "12",gmail: "sagar@gamil.com"),
    "nnn":Friends(gmail: "nnn@gamil.com",age: "34")
  };

  String s1=stdin.readLineSync()!;
  if(mapp.containsKey(s1)){
    Friends f1=mapp[s1] as Friends;
    print(f1.gmail);
    print(f1.age);
  }
}
class Friends{
  String? age;
  String? gmail;

  Friends({required String age,required String gmail}){
    this.age=age;
    this.gmail = this.gmail=gmail;
  }
}