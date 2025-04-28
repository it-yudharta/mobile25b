import 'package:flutter/material.dart';

class NewsEditPage extends StatefulWidget {
  const NewsEditPage({super.key});

  @override
  State<NewsEditPage> createState() => _NewsEditPageState();
}

class _NewsEditPageState extends State<NewsEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit News')),
      body: Center(child: Text('Edit News Page')),
    );
  }
}
