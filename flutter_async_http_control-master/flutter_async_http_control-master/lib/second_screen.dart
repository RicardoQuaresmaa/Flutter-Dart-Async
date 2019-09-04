import 'package:flutter/material.dart';
import 'rest_code.dart';
import 'user_model.dart';
import 'main.dart';

class MainView extends StatefulWidget {
  MainView({Key key, this.urlidx}) : super(key: key);

  static const int idx_bad = 0;
  static const int idx_good = 1;
  static const String tag_good = 'good-url';
  static const String tag_bad = 'bad-url';

  final int urlidx;

  @override
  _MainViewState createState() => _MainViewState(
        urlidx: urlidx,
      );
} // stateful widget

class _MainViewState extends State<MainView> {
  _MainViewState({this.urlidx}) : super();

  final int urlidx;

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllUsers(urlidx);
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Go Home'),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(MyHomePage.tag);
            },
          ),
        ],
      )),
      appBar: AppBar(
        title: Text("Catch Errors"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Use menu in drawer to go home"),
            Flexible(
            child: UserList(),
        )

          ],
        )



      ),
    );
  } // build
}

class UserList extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return StreamBuilder(
      stream: bloc.allUsers,
      builder: (context, AsyncSnapshot<UserModel> snapshot)
      {
        if (snapshot.hasData)
        {
          //returns a listView
          return buildList(snapshot);
        }
        else if (snapshot.hasError)
        {
          print("userlist:  snapshot returned an error");
          return Text(snapshot.error.toString());
        }
        else
        {
          print("userlist:  nothing else happened with the snapshot");
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  } // build

  Widget buildList(AsyncSnapshot<UserModel> snapshot)
  {
    print("snapshot");
    return ListView.builder(
      itemCount: snapshot.data.user.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index)
        {
          return Padding(
              padding: EdgeInsets.all(20),
              child: Text(snapshot.data.user[index].email)
          );
        }
    );
  }

}
