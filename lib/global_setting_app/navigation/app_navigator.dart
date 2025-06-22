import 'package:go_router/go_router.dart';
import 'package:to_movie/global_setting_app/navigation/navigator_routes.dart';
import 'package:to_movie/view/entrance/auth_view.dart';
import 'package:to_movie/view/entrance/registr_view.dart';
import 'package:to_movie/view/entrance/update_pass_view.dart';
import 'package:to_movie/view/home/hub_view.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: NavigatorRoutes.register,
    routes: [
      GoRoute(
          path: NavigatorRoutes.register,
          builder: (context, state) => const RegistrView()),
      GoRoute(
          path: NavigatorRoutes.auth,
          builder: (context, state) => const AuthView()),
      GoRoute(
          path: NavigatorRoutes.updatePassword,
          builder: (context, state) => const UpdatePassView()),
      GoRoute(
          path: NavigatorRoutes.hub,
          builder: (context, state) => const HubView()),
    ],
  );
}
