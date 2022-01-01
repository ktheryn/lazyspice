import 'package:flutter/material.dart';
import 'recipe_instruction_card2.dart';
import 'recipe_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AreaResultsCategory extends StatefulWidget {
  final String title1;

  AreaResultsCategory({
    required this.title1,
  });

  @override
  _AreaResultsCategoryState createState() =>
      _AreaResultsCategoryState(title: title1);
}

class _AreaResultsCategoryState extends State<AreaResultsCategory> {
  _AreaResultsCategoryState({required this.title});

  String title;
  List<String> strArea = [];
  List<String> strAreaThumb1 = [];
  List<String> idMeal = [];
  bool isloading = true;
  bool isempty = true;

  String image =
      'https://image.freepik.com/free-vector/cute-chef-girl-smiling-uniform-welcoming-inviting-his-guests-cartoon-art-illustration_56104-578.jpg';

  void getAreaResults() async {
    http.Response response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?a=' + title));
    //print(await http.read(Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772')));
    print("body response : " + response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      setState(() {
        for (int i = 0; i < jsonDecode(data)['meals'].length; i++) {
          strArea.add(jsonDecode(data)['meals'][i]['strMeal']);
          strAreaThumb1.add(jsonDecode(data)['meals'][i]['strMealThumb']);
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
    Future.delayed(Duration(milliseconds: 200), () {
      getAreaResults();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: strArea.length,
                        itemBuilder: (context, index) {
                          return RecipeCard(
                            title: strArea[index],
                            thumbnailUrl: strAreaThumb1[index],
                            ontappy: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Recipe_Instruction_Card2(
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
