import 'package:client/core/theme/theme.dart';
import 'package:client/lab8/lab8.dart';
import 'package:client/lab9/screens/loading_screen.dart';
import 'package:client/view/page/dangnhap.dart';
import 'package:client/lab1/lab1.dart';
import 'package:client/lab2/lab2.dart';
import 'package:client/lab3/lab3.dart';
import 'package:client/lab4/lab4.dart';
import 'package:client/lab6/lab6.dart';
import 'package:client/lab7/lab7.dart';
import 'package:flutter/material.dart';

import 'lab5/lab5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.dartThemeMode,
      home: const lab9(),
      debugShowCheckedModeBanner: false,
    );
  }
}
