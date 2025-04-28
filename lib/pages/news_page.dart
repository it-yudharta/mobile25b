import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<News>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  void editNewsPage(BuildContext context, Object? arguments) {
    Navigator.pushNamed(context, '/news/edit', arguments: arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Berita')),
      body: Center(
        child: FutureBuilder(
          future: futureNews,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  final news = snapshot.data?[index];
                  return ListTile(
                    title: Text(news?.title ?? ''),
                    subtitle: Text(news?.content ?? ''),
                    onTap: () => editNewsPage(context, news),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => editNewsPage(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<List<News>> fetchNews() async {
  final supabase = Supabase.instance.client;
  final data = await supabase.from('news').select();
  return data.map((e) => News.fromJson(e)).toList();
}

class News {
  final String id;
  final String title;
  final String content;

  const News({required this.id, required this.title, required this.content});

  factory News.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'id': String id, 'title': String title, 'content': String content} =>
        News(id: id, title: title, content: content),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
