import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/weather/data/weatherApiService.dart';
import 'package:weather/features/weather/data/weatherModel.dart';


abstract class WeatherState {}
class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
class WeatherLoaded extends WeatherState {
  final WeatherModel data;
  WeatherLoaded(this.data);
}
class WeatherError extends WeatherState {
  final String msg;
  WeatherError(this.msg);
}

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherApiService api;
  WeatherCubit(this.api) : super(WeatherInitial());

  void load(String city) async {
    emit(WeatherLoading());
    try {
      final json = await api.getWeather(city);
      emit(WeatherLoaded(WeatherModel.fromJson(json)));
    } catch (_) {
      emit(WeatherError('Failed to load weather'));
    }
  }
}
