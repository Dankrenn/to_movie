import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_movie/data/movie.dart';
import 'package:to_movie/view/home/navigation_drawer_view/movie/movie_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareView extends StatefulWidget {
  const ShareView({super.key});

  @override
  State<ShareView> createState() => _ShareViewState();
}

class _ShareViewState extends State<ShareView> {
  late List<Movie> _moviesToShow;
  int _currentIndex = 0;
  Movie? _likedMovie;
  bool _allMoviesViewed = false;

  @override
  void initState() {
    super.initState();
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _moviesToShow = List.from(movieProvider.filteredMovies);
  }

  void _handleLike() {
    setState(() {
      _likedMovie = _moviesToShow[_currentIndex];
    });
  }

  void _handleDislike() {
    _nextMovie();
  }

  void _nextMovie() {
    if (_currentIndex < _moviesToShow.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      setState(() {
        _allMoviesViewed = true;
      });
    }
  }

  void _reset() {
    setState(() {
      _currentIndex = 0;
      _likedMovie = null;
      _allMoviesViewed = false;
      final movieProvider = Provider.of<MovieProvider>(context, listen: false);
      _moviesToShow = List.from(movieProvider.filteredMovies);
    });
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_allMoviesViewed) {
      return _buildAllMoviesViewed();
    }

    if (_likedMovie != null) {
      return _buildMovieDetails(_likedMovie!);
    }

    return _buildMovieCard();
  }

  Widget _buildMovieCard() {
    final movie = _moviesToShow[_currentIndex];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16)),
                  child: Image.network(
                    movie.imageUrl,
                    width: 300,
                    height: 400,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 200),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${movie.year} · ${movie.genres.join(', ')}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildActionButton(
                            Icons.close,
                            Colors.red,
                            'Не нравится',
                            _handleDislike,
                          ),
                          _buildActionButton(
                            Icons.favorite,
                            Colors.green,
                            'Нравится',
                            _handleLike,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      IconData icon,
      Color color,
      String label,
      VoidCallback onPressed,
      ) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          color: color,
          iconSize: 32,
          onPressed: onPressed,
        ),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }

  Widget _buildMovieDetails(Movie movie) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                movie.imageUrl,
                width: 200,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 200),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            movie.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber),
              const SizedBox(width: 4),
              Text('${movie.rating}'),
              const SizedBox(width: 16),
              const Icon(Icons.calendar_today, size: 18),
              const SizedBox(width: 4),
              Text('${movie.year}'),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: movie.genres
                .map((genre) => Chip(label: Text(genre)))
                .toList(),
          ),
          const SizedBox(height: 24),
          const Text(
            'Описание:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(movie.description),

          // Добавляем секцию с ссылками на просмотр
          if (movie.url != null && movie.url!.isNotEmpty) ...[
            const SizedBox(height: 24),
            const Text(
              'Смотреть онлайн:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _launchUrl(movie.url!),
              child: const Text('Перейти к просмотру'),
            ),
          ],

          const SizedBox(height: 32),
          Center(
            child: ElevatedButton(
              onPressed: _reset,
              child: const Text('Начать заново'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllMoviesViewed() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.movie_filter, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'Рекомендации закончились!',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _reset,
            child: const Text('Начать заново'),
          ),
        ],
      ),
    );
  }
}