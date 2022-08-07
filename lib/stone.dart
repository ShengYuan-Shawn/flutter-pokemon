import 'dart:math';
import 'package:flutter/material.dart';

class Stone extends StatefulWidget {
  const Stone({Key? key}) : super(key: key);

  @override
  State<Stone> createState() => _StoneState();
}

class _StoneState extends State<Stone> with SingleTickerProviderStateMixin {
  // Stone Animation Declaration
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2500),
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(-4, 0),
    end: const Offset(4, 0),
  ).animate(
    CurvedAnimation(parent: _animationController, curve: Curves.linear),
  );

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/stone.png'),
          ),
        ),
      ),
    );
  }
}
