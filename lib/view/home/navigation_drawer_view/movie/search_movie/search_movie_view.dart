import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_movie/view/home/navigation_drawer_view/movie/help_widgets/movie_card.dart';
import 'package:to_movie/view/home/navigation_drawer_view/movie/movie_provider.dart';

class SearchMovieView extends StatelessWidget {
  const SearchMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _SearchField(),
        const SizedBox(height: 8),
        Expanded(child: _MovieResults()),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final movieProvider = Provider.of<MovieProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: movieProvider.searchController,
        decoration: InputDecoration(
          hintText: 'Название, жанр или год',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: theme.colorScheme.surface,
        ),
        onChanged: (query) => movieProvider.searchMovies(query),
      ),
    );
  }
}

class _MovieResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    if (movieProvider.isSearching) {
      return const Center(child: CircularProgressIndicator());
    }

    if (movieProvider.filteredMovies.isEmpty) {
      return const Center(
        child: Text(
          'Фильмы не найдены',
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: movieProvider.filteredMovies.length,
      itemBuilder: (context, index) {
        final movie = movieProvider.filteredMovies[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: MovieCard(
            movie: movie,
            onTap: () {}
          ),
        );
      },
    );
  }
}