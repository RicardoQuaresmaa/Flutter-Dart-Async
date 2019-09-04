import 'package:flutter/material.dart';
import 'foodDesc.dart';
class ReuseableCard extends StatelessWidget {
  ReuseableCard({this.image, this.title, this.recipe});
  final title;
  final image;
  final recipe;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      child: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FoodDesc(
                    title: title,
                    image: image,
                    recipe: recipe,
                  );
                }));
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('$image'),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Center(
              child: Text('$title'),
            ),
          )
        ],
      ),
    );
  }
}
