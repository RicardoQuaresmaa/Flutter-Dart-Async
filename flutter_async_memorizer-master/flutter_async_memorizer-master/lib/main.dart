import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _switchValue;

  Future future;
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  void initState() {
    super.initState();

    this._switchValue = false;
     future= Future.delayed(Duration(seconds: 2));

  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Switch(
            value: this._switchValue,
            onChanged: (newValue) {
              setState(() {
                this._switchValue = newValue;
              });
            },
          ),
          FutureBuilder(
              future: this._fetchData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                        child: CircularProgressIndicator()
                    );
                  default:
                    return Center(
                        child: Text(snapshot.data)
                    );
                }
              }
          ),
        ],
      ),
    );
  }

  _fetchData() {
    return this._memoizer.runOnce(() async {
      return 'REMOTE DATA';
    });
  }
}