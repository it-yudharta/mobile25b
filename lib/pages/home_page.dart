import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/setting",
                  arguments: "data dari home",
                );
              },
              icon: Icon(Icons.settings),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: ElevatedButton(
                child: Text("Album"),
                onPressed: () => Navigator.pushNamed(context, '/album'),
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text("Berita"),
                onPressed: () => Navigator.pushNamed(context, '/news'),
              ),
            ),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
