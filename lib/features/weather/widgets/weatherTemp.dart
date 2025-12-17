import 'package:flutter/material.dart';
import 'package:weather/core/theme/fontSize.dart';

class WeatherTemp extends StatelessWidget {
  final double temp;

  const WeatherTemp({super.key, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${temp.round()}°',
      style: TextStyle(
        fontSize: AppFontSize.temp,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
