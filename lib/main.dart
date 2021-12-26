import 'package:flutter/material.dart';
import 'splashscreen.dart';

void main() {
  runApp(const RecipeApp());
}
class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      //home: Homescreen(),
      // Recipe_Instruction_Card2(idNumber: (52874).toString(),),
      //home:Homescreen(),
      home: Splashscreen1(),
    );
  }
}
