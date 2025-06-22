import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_movie/global_setting_app/navigation/app_navigator.dart';
import 'package:to_movie/global_setting_app/theme/theme_provider.dart';
import 'package:to_movie/services/hive_service.dart';
import 'package:to_movie/services/supabase_service.dart';
import 'package:to_movie/view/entrance/entrance_provider.dart';
import 'package:to_movie/view/home/navigation_drawer_view/movie/movie_provider.dart';

import 'view/home/navigation_drawer_view/person/person_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EntranceProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        ChangeNotifierProvider(create: (_) => PersonProvider()),
        Provider(create: (_) => AppRouter()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final appRouter = Provider.of<AppRouter>(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.theme,
      routerConfig: appRouter.router,
    );
  }
}