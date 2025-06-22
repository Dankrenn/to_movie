import 'package:flutter/material.dart';
import 'package:to_movie/view/home/navigation_drawer_view/movie/search_movie/search_movie_view.dart';
import 'package:to_movie/view/home/navigation_drawer_view/movie/top_movie/topic_movie_view.dart';
import 'package:to_movie/view/home/navigation_drawer_view/person/profile/profile_view.dart';
import 'package:to_movie/view/home/navigation_drawer_view/setting/setting_view.dart';
import 'package:to_movie/view/home/navigation_drawer_view/share/share_view.dart';

class HubProvider extends ChangeNotifier{
  int _selectedTab = 0;
  final List<Widget> _tabs = [
    const TopicMovieView(),
    const SearchMovieView(),
    const ShareView(),
    const ProfileView(),
    const SettingView(),
  ];

  List<Widget> get tabs => _tabs;
  int get selectedTab => _selectedTab;
  set selectedTab(value){
    _selectedTab = value;
    notifyListeners();
  }
}
