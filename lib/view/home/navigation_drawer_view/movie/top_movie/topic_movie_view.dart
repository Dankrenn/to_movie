import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_movie/view/home/navigation_drawer_view/movie/help_widgets/movie_card.dart';
import 'package:to_movie/view/home/navigation_drawer_view/movie/movie_provider.dart';

class TopicMovieView extends StatelessWidget {
  const TopicMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final movies = movieProvider.movies;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: movies[index]);
        },
      ),
    );
  }
}
