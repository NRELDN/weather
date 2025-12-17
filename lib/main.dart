import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/responsive/responsiveService.dart';
import 'package:weather/core/theme/theme.dart';
import 'package:weather/features/weather/cubit/weatherCubit.dart';
import 'package:weather/features/weather/data/weatherApiService.dart';
import 'package:weather/features/weather/screens/weatherScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WeatherCubit(WeatherApiService()),
        ),
      ],
      child: Builder(
        builder: (context) {
          // تهيئة ResponsiveService هنا بعد أن يكون context متاحًا
          ResponsiveService.init(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            home: const WeatherScreen(),
          );
        },
      ),
    );
  }
}