import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApiService {
  static const _apiKey = 'a3c857050087cdfeb169c0ec0d66e8fb';
  static const _base = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> getWeather(String city) async {
    final res = await http.get(
      Uri.parse('$_base?q=$city&units=metric&appid=$_apiKey'),
    );

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    throw Exception('API Error');
  }
}
