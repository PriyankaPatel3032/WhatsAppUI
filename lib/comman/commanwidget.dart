import 'package:flutter/cupertino.dart';

 class CommanWidget {

 static Widget textLayout(String name,double fontSize,FontWeight fontWeight){
    return Text(
      name,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight) ,
    );

  }
 static Widget textLayoutWithColor(String name,double fontSize,FontWeight fontWeight,Color color){
   return Text(
     name,
     style: TextStyle(fontSize: fontSize, fontWeight: fontWeight,color: color) ,
   );

 }

}