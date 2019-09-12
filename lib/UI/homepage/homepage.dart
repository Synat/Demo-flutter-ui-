// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
// ignore: non_constant_identifier_names
Scaffold HomePage() {
  return Scaffold( // project://lib/UI/homepage/homepage.pug#2,2
    appBar: AppBar( // project://lib/UI/homepage/homepage.pug#3,3
      title: 
      //-- TITLE ----------------------------------------------------------
      Container( // project://lib/UI/homepage/homepage.pug#4,4
        child: Text( 
          'Welcome',
        ),
      ),
    ),
    body: Center( // project://lib/UI/homepage/homepage.pug#5,3
      child: DefaultTextStyle.merge( 
        child: 
        //-- GREETING ----------------------------------------------------------
        Container( // project://lib/UI/homepage/homepage.pug#6,4
          child: Text( 
            'Hello',
          ),
        ),
        style: TextStyle( 
          fontSize: 30,
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
// ignore: unused_element
__flatten(List list) {
  return List<Widget>.from(list.expand((item) {
    return item is Iterable ? item : [item as Widget];
  }));
}