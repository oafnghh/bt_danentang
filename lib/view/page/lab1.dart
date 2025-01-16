import 'package:flutter/material.dart';

class Lab1 extends StatefulWidget {
  const Lab1({ Key? key }) : super(key: key);

  @override
  _Lab1State createState() => _Lab1State();
}

class _Lab1State extends State<Lab1> {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('I Am rich'),
          titleTextStyle: TextStyle(
            fontSize: 30.0,
          ),
          backgroundColor: const Color.fromARGB(255, 75, 49, 10),
          centerTitle: true,
        ),

        body: Center(
          child: Image.asset('image/so-kim-cuong-6244.jpg'),
        )

      ),
    );
  }
}