import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'category.dart';
import 'area.dart';

class tabBar extends StatefulWidget {
  @override
  State<tabBar> createState() => _tabBarState();
}

class _tabBarState extends State<tabBar> {
  List<String> strCategory = [];
  List<String> strCategoryThumb = [];
  List<String> strArea = [];

  void getcatergories() async {
    http.Response response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
    //print(await http.read(Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772')));
    print("body response : " + response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      for (int i = 0; i < jsonDecode(data)['categories'].length; i++) {
        strCategory.add(jsonDecode(data)['categories'][i]['strCategory']);
        strCategoryThumb
            .add(jsonDecode(data)['categories'][i]['strCategoryThumb']);
      }
      print("status 200 : " + data);
    } else {
      print(response.statusCode);
    }
  }


  void getAreaResults() async {
    http.Response response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/list.php?a=list'));
    //print(await http.read(Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772')));
    print("body response : " + response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      setState(() {
        for (int i = 0; i < jsonDecode(data)['meals'].length; i++) {
          strArea.add(jsonDecode(data)['meals'][i]['strArea']);
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
      getcatergories();
      getAreaResults();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Expanded(
        child: Column(
          children: [
            TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              isScrollable: true,
              // unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.yellow,
              tabs: [
                Tab(
                  text: "Filter by Area".toUpperCase(),
                ),
                Tab(
                  text: "Filter by Meal".toUpperCase(),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Area(title: strArea),
                  Category(title: strCategory, thumbnailUrl: strCategoryThumb),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
