class WeatherModel {
  final String cityName;
  final DateTime date;
  final double averageTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondetion;
  final String image;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.averageTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondetion,
    required this.image,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      averageTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondetion: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
