import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/components/glassCard.dart';
import 'package:weather/components/loader.dart';
import 'package:weather/core/responsive/responsiveService.dart';
import 'package:weather/features/weather/cubit/weatherCubit.dart';
import 'package:weather/features/weather/widgets/weatherHeader.dart';
import 'package:weather/features/weather/widgets/weatherTemp.dart';
import 'package:weather/utils/constants.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveService.init(context);

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return Center(child: const CrystalLoadingIndicator());
            }

            if (state is WeatherLoaded) {
              final data = state.data;

              return Center(
                child: GlassCard(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      WeatherHeader(city: data.city, description: data.desc),
                      const SizedBox(height: 16),
                      WeatherTemp(temp: data.temp),
                    ],
                  ),
                ),
              );
            }

            if (state is WeatherError) {
              return Center(child: Text(state.msg));
            }

            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<WeatherCubit>().load(AppConstants.defaultCity);
                },
                child: const Text('Get Weather'),
              ),
            );
          },
        ),
      ),
    );
  }
}
