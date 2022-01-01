import 'package:flutter/material.dart';
import 'package:lazyspice/homescreen.dart';

void main() {
  runApp(const RecipeApp());
}
class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      home: Homescreen(),
    );
  }
}
