import 'package:flutter/material.dart';
import 'package:riyo_movie_db/model/movie.dart';

class MovieCard extends StatelessWidget{
  MovieCard(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.network(
                  movie.posterURL,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.black.withOpacity(0.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        movie.title,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              )
            ],
            ),
        ),
      ),
    );
  }
}