import 'package:flutter/material.dart';
import '../util/foodData.dart';
import 'reuseableCard.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  List<Widget> foodCard;
  FoodData foodData = FoodData();
  getFoodData() async {
    List<String> title = await foodData.getTitle(2);
    List<String> image = await foodData.getImage(2);
    List<String> recipe = await foodData.getRecipe(2);
    List<String> title2 = await foodData.getTitle(1);
    List<String> image2 = await foodData.getImage(1);
    List<String> recipe2 = await foodData.getRecipe(1);
    List<Widget> foodCards = [];
    for (var i = 0; i < title.length; i++) {
      foodCards.add(ReuseableCard(
        title: title[i],
        image: image[i],
        recipe: recipe[i],
      ));
      foodCards.add(ReuseableCard(
        title: title2[i],
        image: image2[i],
        recipe: recipe2[i],
      ));
    }
    setState(() {
      foodCard = foodCards;
    });
  }

  @override
  void initState() {
    super.initState();
    getFoodData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hot Dishes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: foodCard != null
              ? foodCard
              : [
                  Text('LOADING...'),
                ],
        ),
      ),
    );
  }
}
