import 'package:flutter/material.dart';
import 'homescreen.dart';

class Splashscreen1 extends StatefulWidget {
  const Splashscreen1({Key? key}) : super(key: key);

  @override
  State<Splashscreen1> createState() => _Splashscreen1State();
}

class _Splashscreen1State extends State<Splashscreen1> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Homescreen()), (Route<dynamic> route) => false);
    });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/foodbackground.jpg'),
                fit: BoxFit.fill)),
        child: Container(
          width: MediaQuery.of(context).size.width/2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/food2.jpg'),
                radius: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Spice',
                style: TextStyle(
                  fontFamily: 'Pushster',
                  fontSize: 110,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Container(
              //   height: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/food3.jpg'), fit: BoxFit.fill),),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
