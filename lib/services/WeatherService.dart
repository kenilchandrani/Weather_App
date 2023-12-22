import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';


class WeatherService {


  Future<Weather>? getWeather(String? location) async {

    var endpoint =  Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=8d491df4ca56d3c9a99989349c50763c&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    // Weather weather = Weather.fromJson(body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);




    // var data = jsonDecode(response.body.toString());
    //
    // if (response.statusCode == 200) {
    //   // print(data);
    //   final Map<String, dynamic> data = json.decode(response.body);
    //
    //   return Weather;
    // }
    // else {
    //   throw Exception('Failed to load weather data');
    // }
  }
}