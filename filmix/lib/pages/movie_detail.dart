import 'package:flutter/material.dart';
import 'package:filmix/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path = movie.posterPath.isNotEmpty
        ? imgPath + movie.posterPath
        : 'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF0f0f1a),
      appBar: AppBar(
        backgroundColor: Color(0xFF1a1a2e),
        iconTheme: IconThemeData(color: Color(0xFF7F77DD)),
        title: Text(
          movie.title,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              path,
              width: double.infinity,
              height: height / 2,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: height / 2,
                color: Color(0xFF1a1a2e),
                child: Center(
                  child: Icon(Icons.movie, color: Color(0xFF7F77DD), size: 60),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFEF9F27),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xFF412402),
                              size: 12,
                            ),
                            SizedBox(width: 3),
                            Text(
                              movie.voteAverage.toString(),
                              style: TextStyle(
                                color: Color(0xFF412402),
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'OVERVIEW',
                    style: TextStyle(
                      color: Color(0xFFAFA9EC),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    movie.overview,
                    style: TextStyle(
                      color: Color(0xFFbbbbbb),
                      fontSize: 13,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
