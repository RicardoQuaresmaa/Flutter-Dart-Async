class Movies{
  final int page;
  final int totalResults;
  final int totalPages;
  final List<Movie> results;

  Movies(this.page, this.totalResults, this.totalPages, this.results);

  factory Movies.fromJson(Map json){
    Iterable list = json['results'];
    List<Movie> movies = list.map((model) => Movie.fromJson(model)).toList();

    return Movies(json['page'], json['totalResults'], json['totalPages'], movies);
  }
}

class Movie{
  final int id;
  final String title;
  final String posterURL;

  Movie(this.id, this.title, this.posterURL);

  Movie.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        posterURL = "https://image.tmdb.org/t/p/w500" + json['poster_path'];
}