import 'package:flutter/material.dart';
import 'package:to_movie/data/movie.dart';
import 'package:to_movie/global_setting_app/theme/app_theme.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;

  const MovieCard({super.key, required this.movie, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.surface,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _MoviePoster(imageUrl: movie.imageUrl),
              const SizedBox(width: 16),
              Expanded(child: _MovieInfo(movie: movie)),
            ],
          ),
        ),
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final String imageUrl;

  const _MoviePoster({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: 100,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _MovieInfo extends StatelessWidget {
  final Movie movie;

  const _MovieInfo({required this.movie});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Название
        Text(
          movie.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),

        // Жанры
        Text(
          movie.genres.join(', '),
          style: TextStyle(
            fontSize: 14,
            color: colorScheme.onSurface.withOpacity(0.6),
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 12),

        // Рейтинг и год
        Row(
          children: [
            Icon(Icons.star, color: AppTheme.ratingColor, size: 18),
            const SizedBox(width: 4),
            Text(
              movie.rating.toString(),
              style: TextStyle(
                fontSize: 16,
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              movie.year.toString(),
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Популярность
        if (movie.isPopular ?? false)
          Text(
            'Сейчас в тренде',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.successColor,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}
