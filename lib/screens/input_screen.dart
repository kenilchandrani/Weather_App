import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/screens/weather_details_screen.dart';
class input_screen extends StatefulWidget {
  const input_screen({super.key});

  @override
  State<input_screen> createState() => _input_screenState();
}

class _input_screenState extends State<input_screen> {
  get weatherService => Weather;



  @override
  Widget build(BuildContext context) {

   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height;
   TextEditingController _textController = TextEditingController();
   //
   // String place = '';

    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 110,
              child: TextField(
                  controller: _textController,
                  style: TextStyle(color: Colors.white,),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(

                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),

                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    suffixIcon: IconButton(
                      onPressed: (){
                        _textController.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.white70,
                  ),
                    maxLength: 10,
                ),
            ),

            ElevatedButton(onPressed: ()
                async {
                  Weather data = await weatherService.getWeather(_textController.text);
                  // String Uinput = _textController.text.toString();
                    // print("city = $Uinput");

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => weather_details(Weather)),
              );
            }, child: Text('Submit',style: TextStyle(color: Colors.black ),)
            ),
          ],
        ),
      ),
    );
  }
}
