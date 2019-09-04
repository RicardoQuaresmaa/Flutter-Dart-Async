import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  List _data = await getJSON();

  runApp(
    MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new ListView.builder(
            itemCount: _data.length,
            itemBuilder: (BuildContext context, int position) {
              if (position.isOdd) {
                return new Divider();
              }

              final index = position ~/
                  2; // dividing position by 2 and returning an integer

              return new ListTile(
                title: new Text(
                  '${_data[index]['title']}',
                  style: new TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: new Text(_data[index]['id'].toString()),
                ),
                subtitle: new Text(
                  _data[index]['body'],
                ),
                onTap: () => onListTap(context, '${_data[index]['title']}'),
              );
            },
            padding: const EdgeInsets.all(10.0),
          ),
        ),
      ),
    ),
  );
}

Future<List> getJSON() async {
  String url = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(url);
  return jsonDecode(response.body);
}

void onListTap(BuildContext context, String message) {
  var alert = new AlertDialog(
    title: new Text("Info"),
    content: new Text(message),
    actions: <Widget>[
      new FlatButton(
        child: new Text('Close'),
        onPressed: () => Navigator.pop(context),
      ),
    ],
  );

  // 'child:' in showDialog is deprecated, so use builder instead
  // showDialog(context: context, child: alert);
  showDialog(
    context: context,
    builder: (context) {
      return alert;
    },
  );
}
