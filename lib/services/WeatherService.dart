import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';


class WeatherService {

  Future<Weather>? getWeather(String? location) async {

    var endpoint =  Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=cf8d72acf645e805ae39c3850d379612&units=metric");

    var response = await http.get(endpoint);
    // print("response is --$response");
    var body = jsonDecode(response.body);
    if(response.statusCode == 200){
      // print(Weather.fromJson(body).temp);
      return Weather.fromJson(body);

    }
    else{

      throw Exception('failed to load weather data');

    }

    // print(Weather.fromJson(body).cityName);





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