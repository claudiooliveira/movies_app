import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_app/controllers/movie_controller.dart';
import 'package:movies_app/models/movies_model.dart';
import 'package:movies_app/repositories/movies_repository_implementation.dart';
import 'package:movies_app/service/dio_service_implementation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(
    MoviesRepositoryImplementation(
      DioServiceImplementation(),
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Movies?>(
            future: _controller.fetchMovies(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final Movies? movies = snapshot.data;
                return Observer(
                  builder: (_) {
                    return ListView.builder(
                        itemCount: movies != null ? movies.results.length : 0,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(movies!.results[index].title),
                          );
                        });
                  },
                );
              }
              return Container(
                color: Colors.blue,
              );
            }));
  }
}
