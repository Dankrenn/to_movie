class Movie {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final int year;
  final List<String> genres;
  final String description;
  final Duration duration;
  final bool? isPopular;
  final String url;
  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.year,
    required this.genres,
    required this.description,
    required this.duration,
    required this.url,
    this.isPopular = false,
  });
}