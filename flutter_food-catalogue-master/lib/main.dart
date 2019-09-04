import 'package:flutter/material.dart';
import 'view/foodView.dart';
import 'view/foodDesc.dart';

void main() => runApp(MainComponent());

class MainComponent extends StatefulWidget {
  @override
  _MainComponentState createState() => _MainComponentState();
}

class _MainComponentState extends State<MainComponent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hot Dishes',
      home: FrontPage(),
    );
  }
}





