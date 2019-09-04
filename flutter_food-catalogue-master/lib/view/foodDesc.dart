import 'package:flutter/material.dart';

class FoodDesc extends StatefulWidget {
  FoodDesc({this.image, this.title, this.recipe});
  final String image;
  final String title;
  final String recipe;
  @override
  _FoodDescState createState() => _FoodDescState();
}
class _FoodDescState extends State<FoodDesc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Description',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.image),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                    width: 150.0,
                    child: Divider(color: Colors.black),
                  ),
                  Card(
                    margin: EdgeInsets.only(bottom: 50.0),
                    elevation: 2.0,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'This Food maded with : ${widget.recipe}',
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
