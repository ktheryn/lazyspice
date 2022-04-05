import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final VoidCallback? ontappy;

  RecipeCard({
    required this.title,
    required this.thumbnailUrl,
    required this.ontappy,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontappy,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(
                0.0,
                20.0,
              ),
              blurRadius: 7.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            // colorFilter: ColorFilter.mode(
            //   Colors.black.withOpacity(0.15),
            //   BlendMode.multiply,
            // ),
            image: NetworkImage(thumbnailUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child:
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        // fontFamily: 'Pushster',
                        // fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
