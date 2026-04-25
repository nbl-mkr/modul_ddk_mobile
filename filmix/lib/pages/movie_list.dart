import 'package:flutter/material.dart';
import 'package:filmix/service/http_service.dart';
import 'package:filmix/pages/movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount = 0;
  List movies = [];
  late HttpService service;
  final String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  Future initialize() async {
    movies = [];
    List? result = await service.getPopularMovies();
    setState(() {
      movies = result ?? [];
      moviesCount = movies.length;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0f0f1a),
      appBar: AppBar(
        backgroundColor: Color(0xFF1a1a2e),
        title: Text('Popular Movies', style: TextStyle(color: Colors.white)),
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFF7F77DD),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(Icons.movie, color: Colors.white, size: 18),
        ),
      ),
      body: ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (context, int position) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFF1e1e30), width: 0.5),
              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  imageBaseUrl + movies[position].posterPath,
                  width: 44,
                  height: 64,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 44,
                    height: 64,
                    color: Color(0xFF1a1a2e),
                    child: Icon(Icons.movie, color: Color(0xFF7F77DD)),
                  ),
                ),
              ),
              title: Text(
                movies[position].title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xFFEF9F27), size: 12),
                      SizedBox(width: 3),
                      Text(
                        movies[position].voteAverage.toString(),
                        style: TextStyle(
                          color: Color(0xFFEF9F27),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Icon(Icons.chevron_right, color: Color(0xFF444444)),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (_) => MovieDetail(movies[position]),
                );
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}
