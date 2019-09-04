import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Personas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<User>> _getUsers() async {
    var data =
        await http.get("https://5ca369c58bae720014a9623e.mockapi.io/data");

    var jsonData = [];

    if (data.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      jsonData = json.decode(data.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Unable to load User data');
    }

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["id"], u["createdAt"], u["name"], u["avatar"]);
      users.add(user);
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data[index].avatar),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(
                        Utility.formatDate(snapshot.data[index].createdAt)),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[index])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final User user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Container(
        margin: const EdgeInsets.all(40),
        child: Text(
            '${user.name} has been using our product since ${Utility.formatDateTime(user.createdAt)}.'),
      ),
    );
  }
}

class User {
  final String id;
  final String createdAt;
  final String name;
  final String avatar;

  User(this.id, this.createdAt, this.name, this.avatar);
}

class Utility {
  static String formatDate(date) {
    return new DateFormat("yyyy-MM-dd").format(DateTime.parse(date));
  }

  static String formatDateTime(date) {
    return new DateFormat("yyyy-MM-dd hh:mm aaa").format(DateTime.parse(date));
  }
}
