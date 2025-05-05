import 'package:flutter/material.dart';
import 'package:mobile25b/pages/news_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewsEditPage extends StatefulWidget {
  const NewsEditPage({super.key});

  @override
  State<NewsEditPage> createState() => _NewsEditPageState();
}

class _NewsEditPageState extends State<NewsEditPage> {
  News? news;
  bool loaded = false;

  final _formKey = GlobalKey<FormState>();
  String title = '';
  String content = '';

  Future save(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final supabase = Supabase.instance.client;

      if (news != null) {
        await supabase
            .from('news')
            .update({'title': title, 'content': content})
            .eq('id', news!.id);
      } else {
        await supabase.from('news').insert({
          'title': title,
          'content': content,
        });
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Data berhasil disimpan')));

      Navigator.pop(context, 'ok');
    }
  }

  @override
  Widget build(BuildContext context) {
    news = ModalRoute.of(context)!.settings.arguments as News?;
    if (news != null && !loaded) {
      setState(() {
        title = news!.title;
        content = news!.content;
      });
      loaded = true;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Edit News')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Judul'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan judul berita';
                }
                return null;
              },
              initialValue: title,
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Isi Berita'),
              initialValue: content,
              onChanged: (value) {
                setState(() {
                  content = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () => save(context),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
