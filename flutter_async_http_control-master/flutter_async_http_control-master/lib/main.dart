import 'package:flutter/material.dart';
import 'second_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

//  _MyAppState();

  final routes = <String, WidgetBuilder>{
    MyHomePage.tag: (context) => MyHomePage(title: "Home again",),
    MainView.tag_bad: (context) => MainView(urlidx: MainView.idx_bad,),
    MainView.tag_good: (context) => MainView(urlidx: MainView.idx_good,),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socket Catch Problem',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Socket Catch Problem'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  static String tag = 'first-screen';
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Load Users - Bad Domain'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(MainView.tag_bad);
              },
            ),
            RaisedButton(
              child: Text('Load Users - Good Domain'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(MainView.tag_good);
              },
            ),
          ],
        ),
      ),
    );
  }
}
