import 'package:flutter/material.dart';

class Themes{

  ThemeData pinkTheme(){
    return ThemeData(
      primaryColor: Color(0xffec407a),
      accentColor: Colors.pinkAccent[200],
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.pinkAccent[200],
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  ThemeData greenTheme(){
    return ThemeData(
      primaryColor: Colors.teal[900],
      accentColor: Colors.tealAccent[700],
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.tealAccent[700],
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  ThemeData blueTheme(){
    return ThemeData(
      primaryColor: Colors.blue[800],
      accentColor: Colors.blueAccent[700],
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blueAccent[700],
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

}