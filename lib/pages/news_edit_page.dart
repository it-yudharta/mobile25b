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
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Data berhasil disimpan')));

        Navigator.pop(context, 'ok');
      }
    }
  }

  Future delete(BuildContext context) async {
    // buatkan dialog konfirmasi
    final confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah anda yakin ingin menghapus berita ini?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      final supabase = Supabase.instance.client;
      await supabase.from('news').delete().eq('id', news!.id);

      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Data berhasil dihapus')));

        Navigator.pop(context, 'ok');
      }
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
      appBar: AppBar(
        title: Text((news != null) ? 'Ubah Berita' : 'Tambah Berita'),
        actions:
            (news != null)
                ? [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => delete(context),
                  ),
                ]
                : [],
      ),
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
