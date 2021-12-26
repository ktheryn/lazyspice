import 'package:flutter/material.dart';
import 'recipe_instruction_card2.dart';
import 'recipe_instruction_card.dart';
import 'recipe_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Catergoryresult extends StatefulWidget {
  final String title1;

  Catergoryresult({
    required this.title1,
  });

  @override
  State<Catergoryresult> createState() => _CatergoryresultState(title: title1);
}

class _CatergoryresultState extends State<Catergoryresult> {
  _CatergoryresultState({required this.title});

  String title;
  List<String> strCategory1 = [];
  List<String> strCategoryThumb1 = [];
  List<String> idMeal = [];
  bool isloading = true;

  void filtercatergories() async {
    http.Response response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=' + title));
    //print(await http.read(Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772')));
    print("body response : " + response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      setState(() {
        for (int i = 0; i < jsonDecode(data)['meals'].length; i++) {
          strCategory1.add(jsonDecode(data)['meals'][i]['strMeal']);
          strCategoryThumb1.add(jsonDecode(data)['meals'][i]['strMealThumb']);
          idMeal.add(jsonDecode(data)['meals'][i]['idMeal']);
          isloading = false;
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
      filtercatergories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isloading? Center(child: Container(decoration: BoxDecoration(color: Color(0XFFf3c65f)),child: SpinKitCircle(color: Colors.black, size: 70,)),) :
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: strCategory1.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(
                      title: strCategory1[index],
                      thumbnailUrl: strCategoryThumb1[index],
                      ontappy: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Recipe_Instruction_Card2(
                                idNumber: idMeal[index]),
                          ),
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
