import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting")),
      body: Center(
        child: ElevatedButton(
          child: Text("Kembali"),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
