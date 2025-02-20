import 'dart:math';

import 'package:flutter/material.dart';

class lab3 extends StatefulWidget {
  const lab3({super.key});

  @override
  State<lab3> createState() => _lab3State();
}

class _lab3State extends State<lab3> {
  int lDice   = 1;
  int rDice   = 1;
  void rollDice(){
    setState(() {
      lDice = Random().nextInt(6) + 1;
      rDice = Random().nextInt(6) + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[600],
      appBar: AppBar(
        title: const Text('🎲 Dicee'),
        backgroundColor: Colors.green[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: rollDice,
                    child: Image.asset('image/dice$lDice.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: rollDice,
                    child: Image.asset('image/dice$rDice.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                'Roll Dice!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}