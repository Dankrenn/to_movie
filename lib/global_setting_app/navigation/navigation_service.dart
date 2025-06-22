import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_movie/global_setting_app/navigation/navigator_routes.dart';

class NavigationService {
  static void goToAuth(BuildContext context) =>
      context.push(NavigatorRoutes.auth);

  static void goToRegister(BuildContext context) =>
      context.go(NavigatorRoutes.register);

  static void goToUpdatePassword(BuildContext context) =>
      context.push(NavigatorRoutes.updatePassword);

  static void goToHub(BuildContext context) =>
      context.go(NavigatorRoutes.hub);

  static void goBack(BuildContext context) =>
      context.pop();
}