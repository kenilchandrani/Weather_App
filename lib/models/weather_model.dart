import 'dart:core';

class Weather{
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  int? pressure;


  Weather(
  {
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.pressure

  });

  Weather.fromJson(Map<String, dynamic>json){
    cityName=json["name"];
    temp=json["main"]["temp"];
    wind=json["wind"]["speed"];
    humidity=json["main"]["humidity"];
    pressure=json["main"]["pressure"];


  }
}