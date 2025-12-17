class WeatherModel {
  final String city;
  final double temp;
  final String desc;
  final String icon;

  WeatherModel({
    required this.city,
    required this.temp,
    required this.desc,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      temp: json['main']['temp'].toDouble(),
      desc: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}
