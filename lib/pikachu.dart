import 'dart:math';
import 'package:flutter/material.dart';

class Pikachu extends StatefulWidget {
  const Pikachu({Key? key}) : super(key: key);

  @override
  State<Pikachu> createState() => PikachuState();
}

class PikachuState extends State<Pikachu> with SingleTickerProviderStateMixin {
  bool isJump = false;

  // Animation Declaration
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 0),
    end: const Offset(0, -6),
  ).animate(
    CurvedAnimation(parent: _animationController, curve: Curves.linear),
  );

  void jumping() {
    setState(
      () {
        isJump != isJump;
        _animationController.forward().then(
              (_) => _animationController.reverse().then(
                (_) {
                  isJump = false;
                },
              ),
            );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(isJump ? 'assets/jump.png' : 'assets/stay.png'),
          ),
        ),
      ),
    );
  }
}
