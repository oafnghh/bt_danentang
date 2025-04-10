import 'dart:math';

import 'package:flutter/material.dart';

class lab4 extends StatefulWidget {
  const lab4({super.key});

  @override
  State<lab4> createState() => _lab4State();
}

class _lab4State extends State<lab4> {
  int ball = 1;
  void Ball() {
    setState(() {
      ball = Random().nextInt(5) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        title: const Text('🎱 Magic 8 Ball'),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            TextButton(
              onPressed: Ball,
              child: Image.asset('image/ball$ball.png'),
            ),
          ],
        ),
      ),
    );
  }
}
