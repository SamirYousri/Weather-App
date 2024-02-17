import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weatherModel.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '218178ca77c042f7b5b161733242901';
  WeatherService(this.dio);

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String getMessage = e.response?.data['error']['message'] ??
          'Oops there was an error , try later';
      throw Exception(getMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops there was an error , try later');
    }
  }
}
