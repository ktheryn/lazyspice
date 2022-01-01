import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Recipe_Instruction_Card2 extends StatefulWidget {
  final String idNumber;
  Recipe_Instruction_Card2({required this.idNumber});

  @override
  State<Recipe_Instruction_Card2> createState() =>
      _Recipe_Instruction_Card2State(idNumber: idNumber);
}

class _Recipe_Instruction_Card2State extends State<Recipe_Instruction_Card2> {
  _Recipe_Instruction_Card2State({required this.idNumber});

  String idNumber;

  bool isloading = true;
  String strMeal2 = '';
  String strMealThumb2 = '';
  String idMeal2 = '';
  String strInstructions2 = '';
  List<String> listInstructions = [];
  List<String> strIngredient2 = [];
  List<String> strMeasure2 = [];
  //List<String> strInstructions2list(String strInstructions2) => strInstructions2.split('.');

  void getrecipefull() async {
    http.Response response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=' + idNumber));
    //print(await http.read(Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772')));
    print("body response : " + response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      print(strMealThumb2);
      setState(() {
        strMeal2 = (jsonDecode(data)['meals'][0]['strMeal']);
        strMealThumb2 = (jsonDecode(data)['meals'][0]['strMealThumb']);
        print("after");
        print(strMealThumb2);
        strInstructions2 = (jsonDecode(data)['meals'][0]['strInstructions']);
        listInstructions = strInstructions2.split('\n');
        idMeal2 = (jsonDecode(data)['meals'][0]['idMeal']);
        isloading = false;
        for (int j = 0; j < 20; j++) {
          if (jsonDecode(data)['meals'][0]
                      ['strIngredient' + (j + 1).toString()] ==
                  null ||
              jsonDecode(data)['meals'][0]
                      ['strIngredient' + (j + 1).toString()] ==
                  "") {
            print("not");
          } else {
            print(jsonDecode(data)['meals'][0]
                ['strIngredient' + (j + 1).toString()]);
            strIngredient2.add(jsonDecode(data)['meals'][0]
                ['strIngredient' + (j + 1).toString()]);
            strMeasure2.add(jsonDecode(data)['meals'][0]
                ['strMeasure' + (j + 1).toString()]);
          }
        }
      });
      print("status 200 : " + data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      getrecipefull();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.yellow,
        body: isloading
            ? Center(
          child: Container(
              decoration: BoxDecoration(color: Colors.yellow),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Now Cooking...', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  SpinKitFadingFour(
                    color: Colors.black,
                    size: 100,
                  ),
                ],
              )),
        )
            : SafeArea(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            strMealThumb2,
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.95,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 10, bottom: 20),
                                child: Center(
                                  child: Text(
                                    strMeal2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'INSTRUCTIONS',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Divider(color: Colors.yellow, thickness: 3, indent: 30, endIndent: 30,),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: strIngredient2.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 50, bottom: 10),
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.utensils,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      strMeasure2[index],
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      strIngredient2[index],
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: listInstructions.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.only(right: 20, left: 20, bottom: 10),
                            child: Text(
                              "Step " +
                                  (index + 1).toString() +
                                  ": " +
                                  listInstructions[index],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
