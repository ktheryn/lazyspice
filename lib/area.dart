import 'package:flutter/material.dart';
import 'recipe_card.dart';
import 'arearesults.dart';


class Area extends StatelessWidget {
  final List<String> title;
  bool isloading = true;

  Area({required this.title});

  List<String> strAreaThumb1= [
    'https://www.themealdb.com/images/media/meals/ursuup1487348423.jpg',
    'https://www.themealdb.com/images/media/meals/vvpprx1487325699.jpg',
    'https://www.themealdb.com/images/media/meals/wpputp1511812960.jpg',
    'https://www.themealdb.com/images/media/meals/1525872624.jpg',
    'https://www.themealdb.com/images/media/meals/pn59o51628769837.jpg',
    'https://www.themealdb.com/images/media/meals/lhqev81565090111.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/rlwcc51598734603.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/qqpwsy1511796276.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/k29viq1585565980.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/qptpvt1487339892.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/n41ny81608588066.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/x0lk931587671540.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/ussyxw1515364536.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/tyywsw1505930373.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/cuio7s1555492979.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/rvypwy1503069308.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/qtuwxu1468233098.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/vpxyqt1511464175.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/md8w601593348504.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/ewcikl1614348364.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/svprys1511176755.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/quuxsx1511476154.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/tvttqv1504640475.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/t8mn9g1560460231.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/mlchx21564916997.jpg',
    'https://www.themealdb.com/images/media/meals/n7qnkb1630444129.jpg',
    'https:\/\/www.themealdb.com\/images\/media\/meals\/qqwypw1504642429.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child:
            ListView.builder(
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: title[index],
                      thumbnailUrl: strAreaThumb1[index],
                      ontappy: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AreaResultsCategory(title1: title[index]),
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
