import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:riyo_movie_db/custom_component/movie_card.dart';
import 'dart:convert';
import 'package:riyo_movie_db/model/movie.dart';

import 'dart:async';
import 'package:async_loader/async_loader.dart';
import 'package:riyo_movie_db/services/home_service.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<AsyncLoaderState> asyncLoaderState = new GlobalKey<AsyncLoaderState>();

  initState() {
    super.initState();
  }

  bool isRefresh = false;

  Widget getMovieGrid(Movies movies) {
    return new Center(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 10/15,
            children: List.generate(movies.results.length, (index){
              return MovieCard(movies.results[index]);
            })
          ),
        ),
    );
  }

  Widget getNoConnectionWidget(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 60.0,
          child: new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/no_connection.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        new Text("No Internet Connection"),
        new FlatButton(
            color: Colors.red,
            child: new Text("Retry", style: TextStyle(color: Colors.white),),
            onPressed: () => asyncLoaderState.currentState.reloadState())
      ],
    );
  }

  Future<Null> _handleRefresh() async {
    asyncLoaderState.currentState.reloadState();
    return null;
  }

  Widget handleLoading(){
    return Center(child: new CircularProgressIndicator());
    if(isRefresh){
      return null;
    }else{
      return Center(child: new CircularProgressIndicator());
    }
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    var _asyncLoader = new AsyncLoader(
      key: asyncLoaderState,
      initState: () async => await getMovies(),
      renderLoad: () => handleLoading(),
      renderError: ([error]) => getNoConnectionWidget(),
      renderSuccess: ({data}) => getMovieGrid(data),
    );
    
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Home object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () => _handleRefresh(),
        child: _asyncLoader,
      ),
    );
  }
}
