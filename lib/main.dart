import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: "Contoh"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //   children: [
    //     Expanded(child: CounterWidget()),
    //     Expanded(flex: 2, child: CounterWidget()),
    //     Expanded(child: CounterWidget()),
    //   ],
    // );

    return ListView(
      children: [
        CounterWidget(),
        CounterWidget(),
        CounterWidget(),
        CounterWidget(),
        CounterWidget(),
        CounterWidget(),
        CounterWidget(),
        CounterWidget(),
        CounterWidget(),
        CounterWidget(),
        CounterWidget(),
        CounterWidget(),
        CounterWidget(),
        CounterWidget(),
      ],
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<StatefulWidget> createState() => _CounterState();
}

class _CounterState extends State<CounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text('$_counter'),
          FloatingActionButton(onPressed: _increment),
        ],
      ),
    );
  }
}
