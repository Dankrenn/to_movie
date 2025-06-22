import 'package:flutter/material.dart';
import 'package:to_movie/data/movie.dart';

class MovieProvider extends ChangeNotifier {
  final List<Movie> _movies = [];
  final TextEditingController searchController = TextEditingController();
  List<Movie> filteredMovies = [];
  bool isSearching = false;
  Movie? selectedMovie;

  List<Movie> get movies => _movies;

  MovieProvider() {
    loadMovies();
  }

  void loadMovies() {
    _movies.addAll([
      Movie(
          id: '1',
          title: 'Крестный отец',
          imageUrl:
              'https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg',
          rating: 9.2,
          year: 1972,
          genres: ['Криминал', 'Драма'],
          description: 'Эпическая история сицилийской мафиозной семьи...',
          duration: const Duration(hours: 2, minutes: 55),
          isPopular: true,
          url: 'https://godfather-film.ru/1-1972-lord/'),
      Movie(
        id: '2',
        title: 'Крестный отец 2',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg',
        rating: 9.0,
        year: 1974,
        genres: ['Криминал', 'Драма'],
        description: 'Продолжение истории семьи Корлеоне...',
        duration: const Duration(hours: 3, minutes: 22),
        url: 'https://wu.lordfilm12.ru/filmy/8740-krestniy-otets-2-1974.html',
      ),
      Movie(
        id: '3',
        title: 'Темный рыцарь',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg',
        rating: 9.0,
        year: 2008,
        genres: ['Боевик', 'Драма'],
        description: 'Бэтмен сталкивается с Джокером...',
        duration: const Duration(hours: 2, minutes: 32),
        url: 'https://wu.lordfilm12.ru/filmy/8740-krestniy-otets-2-1974.html',
      ),
      Movie(
        id: '4',
        title: 'Побег из Шоушенка',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/8/81/ShawshankRedemptionMoviePoster.jpg',
        rating: 9.3,
        year: 1994,
        genres: ['Драма'],
        description: 'История надежды и дружбы в тюрьме...',
        duration: const Duration(hours: 2, minutes: 22),
        isPopular: true, url: 'https://wu.lordfilm12.ru/filmy/8740-krestniy-otets-2-1974.html',
      ),
      Movie(
        id: '5',
        title: 'Властелин колец: Возвращение короля',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/8/81/ShawshankRedemptionMoviePoster.jpg',
        rating: 8.9,
        year: 2003,
        genres: ['Фэнтези', 'Приключения'],
        description: 'Финальная часть трилогии о кольце всевластия...',
        duration: const Duration(hours: 3, minutes: 21),
        url: 'https://wu.lordfilm12.ru/filmy/8740-krestniy-otets-2-1974.html',
      ),
      Movie(
        id: '6',
        title: 'Пульп Фикшн',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/3/3b/Pulp_Fiction_%281994%29_poster.jpg',
        rating: 8.9,
        year: 1994,
        genres: ['Криминал', 'Драма'],
        description: 'Истории преступного мира Лос-Анджелеса...',
        duration: const Duration(hours: 2, minutes: 34),
        url: 'https://wu.lordfilm12.ru/filmy/8740-krestniy-otets-2-1974.html',
      ),
      Movie(
        id: '7',
        title: 'Форрест Гамп',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/6/67/Forrest_Gump_poster.jpg',
        rating: 8.8,
        year: 1994,
        genres: ['Драма', 'Комедия'],
        description: 'История жизни простодушного Форреста Гампа...',
        duration: const Duration(hours: 2, minutes: 22),
        url: 'https://wu.lordfilm12.ru/filmy/8740-krestniy-otets-2-1974.html',
      ),
      Movie(
        id: '8',
        title: 'Начало',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg',
        rating: 8.8,
        year: 2010,
        genres: ['Фантастика', 'Боевик'],
        description: 'Воры, проникающие в подсознание через сны...',
        duration: const Duration(hours: 2, minutes: 28),
        url: 'https://wu.lordfilm12.ru/filmy/8740-krestniy-otets-2-1974.html',
      ),
      Movie(
        id: '9',
        title: 'Матрица',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg',
        rating: 8.7,
        year: 1999,
        genres: ['Фантастика', 'Боевик'],
        description: 'Человечество живет в симуляции, созданной машинами...',
        duration: const Duration(hours: 2, minutes: 16),
        url: 'https://wu.lordfilm12.ru/filmy/8740-krestniy-otets-2-1974.html',
      ),
      Movie(
        id: '10',
        title: 'Гладиатор',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/f/fb/Gladiator_%282000_film_poster%29.png',
        rating: 8.5,
        year: 2000,
        genres: ['Драма', 'Боевик'],
        description: 'История мести римского генерала...',
        duration: const Duration(hours: 2, minutes: 35),
        url: 'https://wu.lordfilm12.ru/filmy/8740-krestniy-otets-2-1974.html',
      ),
      Movie(
        id: '11',
        title: 'Интерстеллар',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg',
        rating: 8.6,
        year: 2014,
        genres: ['Фантастика', 'Приключения'],
        description: 'Команда исследователей путешествует через червоточину...',
        duration: const Duration(hours: 2, minutes: 49),
        url: 'https://wu.lordfilm12.ru/filmy/8740-krestniy-otets-2-1974.html',
      ),
      Movie(
        id: '12',
        title: 'Бойцовский клуб',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/f/fc/Fight_Club_poster.jpg',
        rating: 8.8,
        year: 1999,
        genres: ['Драма', 'Триллер'],
        description: 'История о подпольных боях и двойной личности...',
        duration: const Duration(hours: 2, minutes: 19),
        url: 'https://wu.lordfilm12.ru/filmy/8740-krestniy-otets-2-1974.html',
      ),
      Movie(
        id: '13',
        title: 'Список Шиндлера',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/3/38/Schindler%27s_List_movie.jpg',
        rating: 8.9,
        year: 1993,
        genres: ['Драма', 'История'],
        description: 'История спасения евреев во время Холокоста...',
        duration: const Duration(hours: 3, minutes: 15),
        url: 'https://wu.lordfilm12.ru/filmy/8740-krestniy-otets-2-1974.html',
      ),
      Movie(
        id: '14',
        title: 'Титаник',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/3/38/Schindler%27s_List_movie.jpg',
        rating: 7.8,
        year: 1997,
        genres: ['Драма', 'Романтика'],
        description: 'История любви на фоне катастрофы Титаника...',
        duration: const Duration(hours: 3, minutes: 14),
        url: 'https://wu.lordfilm12.ru/filmy/8740-krestniy-otets-2-1974.html',
      ),
    ]);
    filteredMovies = List.from(_movies);
    notifyListeners();
  }

  void searchMovies(String query) {
    isSearching = true;
    notifyListeners();

    if (query.isEmpty) {
      filteredMovies = List.from(_movies);
    } else {
      final lowerQuery = query.toLowerCase();
      filteredMovies = _movies.where((movie) {
        return movie.title.toLowerCase().contains(lowerQuery) ||
            movie.genres
                .any((genre) => genre.toLowerCase().contains(lowerQuery)) ||
            movie.year.toString().contains(query);
      }).toList();
    }

    isSearching = false;
    notifyListeners();
  }
}
