import 'package:flutter/material.dart';
import 'package:weather/core/theme/fontSize.dart';

class WeatherHeader extends StatelessWidget {
  final String city;
  final String description;

  const WeatherHeader({
    super.key,
    required this.city,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          city,
          style: TextStyle(
            fontSize: AppFontSize.title,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: AppFontSize.body,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
