import 'package:flutter/material.dart';
import 'package:weatherapp/services/api.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherApi api = new WeatherApi();
  String weather = "";
  String weather_description = "";
  _WeatherScreenState() {
    setWeather('Karachi');
  }

  setWeather(String city) async {
    await WeatherApi.getWeather(city).then((weather) {
      setState(() {
        this.weather = weather['main']['temp'].toString();
        this.weather_description = weather['weather'][0]['description'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Karachi Temperature  = " + weather + " C\n Descripton = " + weather_description),
      ),
    );
  }
}
