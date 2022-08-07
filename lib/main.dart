import 'package:flutter/material.dart';
import 'package:flutter_pokemon/pikachu.dart';
import 'package:flutter_pokemon/stone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Game',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Pokemon Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // Score Count Declaration
  int countScore = 0;

  // ignore: non_constant_identifier_names
  final GlobalKey<PikachuState> PikachuKey = GlobalKey();

  void scorePoints() {
    setState(() {
      countScore++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // margin: const EdgeInsets.only(bottom: 100),
          Container(
            padding: const EdgeInsets.only(top: 80, bottom: 280),
            child: Text(
              'Score: $countScore',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Stack(
              children: <Widget>[
                Stone(),
                Positioned(
                  child: Pikachu(key: PikachuKey),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(
              () {
                PikachuKey.currentState?.jumping();
              },
            );
          },
          child: const Text('Jump!')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
