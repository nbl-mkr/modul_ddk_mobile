import 'package:flutter/material.dart';
import 'package:todo/service/http_service.dart';
import 'package:todo/pages/todo_detail.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  int movieCount = 0;
  late List movies;
  late HttpService service;

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      movieCount = movies.length;
      movies = movies;
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Todo List", style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: movieCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/50?random=${movies[position].id}',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.broken_image),
                ),
              ),
              title: Text(movies[position].id.toString()),
              subtitle: Text('Title = ' + movies[position].title),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (_) => TodoDetail(movies[position]),
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
