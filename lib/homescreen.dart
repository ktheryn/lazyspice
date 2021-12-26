import 'package:flutter/material.dart';
import 'body.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Padding(
        //     padding: EdgeInsets.only(left: 30, top: 15),
        //     child: Text(
        //       'Spice',
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //           fontFamily: 'Pushster',
        //           fontSize: 40),
        //     ),
        //   ),
        //   titleSpacing: 0.5,
        //   elevation: 0,
        //   backgroundColor: Color(0XFFf3c65f),
        // ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.17,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0XFFf3c65f),),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Spice',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pushster',
                        fontSize: 50),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Learn different recipes easy!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Licorice',
                        fontSize: 40),
                  ),
                ],
              ),
            ),
            tabBar(),
          ],
        ),
      ),
    );
  }
}
