import 'package:flutter/material.dart';
import 'package:mobile25b/pages/album_page.dart';
import 'package:mobile25b/pages/home_page.dart';
import 'package:mobile25b/pages/news_edit_page.dart';
import 'package:mobile25b/pages/news_page.dart';
import 'package:mobile25b/pages/setting_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://gynysildsdmjtqhjinot.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd5bnlzaWxkc2RtanRxaGppbm90Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDUyMTk0MTQsImV4cCI6MjA2MDc5NTQxNH0.5nMAx-p7jmulMzm8wW5HuSkryh7c0ZnFbMgHuAQjgzQ',
  );
  runApp(MyApp());
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
        '/news/edit': (context) => const NewsEditPage(),
      },
    );
  }
}
