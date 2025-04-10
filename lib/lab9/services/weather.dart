import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location.dart';

const apiKey = 'c939f80244466fc0224219db11cabc21';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    var response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    var url =
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    var response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) return '🌩';
    if (condition < 400) return '🌧';
    if (condition < 600) return '☔️';
    if (condition < 700) return '☃️';
    if (condition < 800) return '🌫';
    if (condition == 800) return '☀️';
    if (condition <= 804) return '☁️';
    return '🤷‍';
  }

  String getMessage(int temp) {
  if (temp > 25) return 'Thời tiết nóng, đi ăn kem thôi 🍦';
  if (temp > 20) return 'Thời tiết đẹp, mặc áo thun và quần short 👕';
  if (temp < 10) return 'Trời lạnh đó, nhớ mang khăn 🧣 và găng tay 🧤';
  return 'Mang theo áo khoác 🧥 cho chắc nha';
}

}
