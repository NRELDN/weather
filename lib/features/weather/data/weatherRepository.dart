import 'package:weather/features/weather/data/weatherApiService.dart';
import 'package:weather/features/weather/data/weatherModel.dart';

class WeatherRepository {
  final WeatherApiService api;

  WeatherRepository(this.api);

  Future<WeatherModel> fetchWeather(String city) async {
    final json = await api.getWeather(city);
    return WeatherModel.fromJson(json);
  }
}
