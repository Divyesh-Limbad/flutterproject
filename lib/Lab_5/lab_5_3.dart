// WAP that creates List with following value:“Delhi”, “Mumbai”, “Bangalore”, “Hyderabad” and
// “Ahmedabad” Replace “Ahmedabad” with “Surat” in above List.

import 'dart:io';

void main(){
  List<String> liststring = ['Delhi', 'Mumbai', 'Bangalore', 'Hyderabad', 'Ahmedabad'];
  for(int i=0;i<liststring.length;i++){
    if(liststring[i]=='Ahmedabad'){
      liststring[i]='Surat';
    }
  }
  print(liststring);
}