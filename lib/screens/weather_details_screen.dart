import 'dart:convert';
import 'package:weather_app/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/services/WeatherService.dart';

class weather_details extends StatelessWidget {


   weather_details(Type weather, {super.key});

WeatherService weather = WeatherService();

Weather? data;

 Future<void> getData() async{
      data = await weather.getWeather("surat");
 }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getData(),
      builder: (context,snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${data!.cityName}", style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Column(
                          
                        ),SizedBox(
                            width: 10,
                        ),
                            Column(
                              children: [
                                Text(
                                "Temp :-", style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),

                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text("${data!.temp}", style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Humadity :-", style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text("${data!.humidity}%", style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Wind :-", style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                       Column(
                          children: [
                            Text("${data!.wind}", style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Pressure :-", style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text("${data!.pressure}", style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          );
        }
        else if(snapshot.connectionState == ConnectionState.none) {
          return Center(child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );
  }
}


