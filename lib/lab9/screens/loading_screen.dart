import 'package:flutter/material.dart';
import '../services/weather.dart';
import 'location_screen.dart';

class lab9 extends StatefulWidget {
  const lab9({super.key});

  @override
  State<lab9> createState() => _lab9State();
}

class _lab9State extends State<lab9> {
  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  void getLocationWeather() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => LocationScreen(locationWeather: weatherData),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
