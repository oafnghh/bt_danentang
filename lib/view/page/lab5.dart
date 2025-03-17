import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class lab5 extends StatefulWidget {
  const lab5({super.key});

  @override
  State<lab5> createState() => _lab5State();
}

class _lab5State extends State<lab5> {
  final AudioPlayer player = AudioPlayer();

  void playSound(int noteNumber) async {
    await player.play(AssetSource('image/note$noteNumber.wav'));
  }
  Expanded buildKey({required int number, required Color color}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(number);
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        child: SizedBox.shrink(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildKey(number: 1, color: Colors.red),
          buildKey(number: 2, color: Colors.orange),
          buildKey(number: 3, color: Colors.yellow),
          buildKey(number: 4, color: Colors.green),
          buildKey(number: 5, color: Colors.teal),
          buildKey(number: 6, color: Colors.blue),
          buildKey(number: 7, color: Colors.purple),
        ],
      ),
    );
  }
}