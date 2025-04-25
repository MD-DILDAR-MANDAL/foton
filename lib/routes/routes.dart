import 'package:flutter/material.dart';
import 'package:foton/pages/gallery_screen.dart';
import 'package:foton/pages/main_page.dart';

class RouteManager {
  static const String homePage = '/';
  static const String gallery = '/galleryScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => MainPage());
      case gallery:
        return MaterialPageRoute(builder: (context) => GalleryScreen());
      default:
        throw FormatException('Routes not Found ! check routes again');
    }
  }
}
