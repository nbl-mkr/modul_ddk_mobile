class Movie {
  late int id;
  late String title;
  late double voteAverage;
  late String overview;
  late String posterPath;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['id'],
      json['title'],
      json['vote_average'].toDouble(),
      json['overview'],
      json['poster_path'] ?? '',
    );
  }
}
