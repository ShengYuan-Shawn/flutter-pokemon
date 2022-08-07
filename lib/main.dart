import 'package:flutter/material.dart';

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
  int speed = 1500;

  // Animation Declaration
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  // Score Increment
  void incrementScore() {
    setState(() {
      countScore++;
    });
  }

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6))
          ..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: Offset(1.5, 0),
      end: const Offset(1.5, 0),
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(50),
              child: Text(
                'Score: ${countScore}',
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/stay.png',
                  width: 120,
                  height: 120,
                ),
                Image.asset(
                  'assets/stone.png',
                  position: _offsetAnimation,
                  width: 120,
                  height: 120,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                countScore++;
              },
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              child: const Text('Jump!'),
            )
          ],
        ),
      ),
    );
  }
}
