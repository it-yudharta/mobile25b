import 'package:flutter/material.dart';
import 'package:mobile25b/pages/album_page.dart';
import 'package:mobile25b/pages/home_page.dart';
import 'package:mobile25b/pages/news_page.dart';
import 'package:mobile25b/pages/setting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      // home: HomePage(),
      initialRoute: "/",
      routes: {
        '/': (context) => const HomePage(),
        '/setting': (context) => const SettingPage(),
        '/album': (context) => const AlbumPage(),
        '/news': (context) => const NewsPage(),
      },
    );
  }
}
