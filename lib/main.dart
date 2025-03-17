import 'package:client/core/theme/theme.dart';
import 'package:client/view/page/dangnhap.dart';
import 'package:client/view/page/lab1.dart';
import 'package:client/view/page/lab2.dart';
import 'package:client/view/page/lab3.dart';
import 'package:client/view/page/lab4.dart';
import 'package:flutter/material.dart';

import 'view/page/lab5.dart';

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
      home: const DangNhap(),
      debugShowCheckedModeBanner: false,
    );
  }
}
