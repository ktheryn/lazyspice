import 'package:flutter/material.dart';
import 'categoryresult.dart';
import 'recipe_card.dart';


class Category extends StatelessWidget {
  final List<String> title;
  final List<String> thumbnailUrl;

  Category({
    required this.title,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: title.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(
                        title: title[index],
                        thumbnailUrl: thumbnailUrl[index],
                        ontappy: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Catergoryresult(
                                    title1: title[index])),
                          );
                        });
                  }),
            )
          ],
        ));
  }
}
