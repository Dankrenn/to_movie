import 'package:flutter/material.dart';
import 'package:to_movie/data/user_app.dart';

class PersonProvider extends ChangeNotifier {
  late UserApp _user;
  UserApp get user => _user;

  PersonProvider(){
    loadUserData();
  }

  Future<void> loadUserData() async {
    _user = UserApp(id: '1', name: 'Егор', email: "davren@gmail.com");
  }
}
