import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Recipe_Instruction_Card extends StatefulWidget {
  final String idNumber;
  Recipe_Instruction_Card({required this.idNumber});

  @override
  State<Recipe_Instruction_Card> createState() =>
      _Recipe_Instruction_CardState(idNumber: idNumber);
}

class _Recipe_Instruction_CardState extends State<Recipe_Instruction_Card> {
  _Recipe_Instruction_CardState({required this.idNumber});

  String idNumber;

  String strMeal2 = '';
  String strMealThumb2 = '';
  String idMeal2 = '';
  String strInstructions2 = '';
  String paragraph = 'sen1.sen2.sen3.sen4.sen5.';
  List<String> strIngredient2 = [];
  List<String> strMeasure2 = [];

  void getrecipefull() async {
    print("para");
    print(paragraph.split("."));

    http.Response response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=' + idNumber));
    //print(await http.read(Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772')));
    print("body response : " + response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      setState(() {
        strMeal2 = (jsonDecode(data)['meals'][0]['strMeal']);
        strMealThumb2 = (jsonDecode(data)['meals'][0]['strMealThumb']);
        strInstructions2 = (jsonDecode(data)['meals'][0]['strInstructions']);

        print("strInstructions2 just");
        print(strInstructions2);
        print("strInstructions2 just1");
        print(strInstructions2.split("."));

        idMeal2 = (jsonDecode(data)['meals'][0]['idMeal']);
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Image.network(
                strMealThumb2,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        strMeal2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'INGREDIENTS',
                            style: TextStyle(
                              fontSize: 23,
                              // fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Divider(
                            color: Colors.black.withOpacity(0.5),
                            thickness: 2,
                            height: 20,
                            indent: 40,
                            endIndent: 40,
                          ),
                          Expanded(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: strIngredient2.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                  EdgeInsets.only(left: 50, bottom: 10),
                                  child: Column(
                                    children: [
                                      Row(
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
                                              Text(strMeasure2[index]),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text(strIngredient2[index]),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'INSTRUCTIONS',
                      style: TextStyle(
                        fontSize: 23,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 50, bottom: 10, right: 50),
                        child: Container(
                          child: Text(
                            strInstructions2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
