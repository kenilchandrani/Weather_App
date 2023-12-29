import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/screens/weather_details_screen.dart';
class input_screen extends StatefulWidget {
  const input_screen({super.key, this.child});
  final Widget? child;



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
   final _formKey = GlobalKey<FormState>();
   // bool validate = true;
   //
   // String place = '';
   // String _error = "";

    return Scaffold(
      backgroundColor: Colors.black,

      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://i.redd.it/ehhvzjdx1s091.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 110,
                    child: TextFormField(
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
                         // errorText: validate? "value can't be empty" : null,

                        ),
                          maxLength: 10,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Value can't be empty";
                        }
                        // etrurn null; // Return null if the input is valid
                      },
                      ),
                  ),
                  ElevatedButton(onPressed: ()
                       {

                       if(_formKey.currentState?.validate() ?? false)
                       {
                       Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) =>
                       weather_details(city: _textController.text)),
                       );
                       }
                  },
                      child: const Text('Submit',style: TextStyle(color: Colors.black ),),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
