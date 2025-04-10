import 'package:client/lab9/constants.dart';
import 'package:flutter/material.dart';
import '../services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final dynamic locationWeather;

  const LocationScreen({super.key, required this.locationWeather});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;

  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
  setState(() {
    if (weatherData == null || weatherData['main'] == null) {
      temperature = 0;
      weatherIcon = '❌';
      weatherMessage = 'Không lấy được dữ liệu thời tiết';
      cityName = '';
      return;
    }

    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    var condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    weatherIcon = weather.getWeatherIcon(condition);
    weatherMessage = weather.getMessage(temperature);
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.near_me, size: 40),
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.location_city, size: 40),
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CityScreen()),
                      );
                      if (typedName != null) {
                        var weatherData = await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                  ),
                ],
              ),
              Text('$temperature°', style: kTempTextStyle),
              Text('$weatherIcon', style: kConditionTextStyle),
              Text(
                '$weatherMessage',
                textAlign: TextAlign.center,
                style: kMessageTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
