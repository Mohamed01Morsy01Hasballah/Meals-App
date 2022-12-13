import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme=ThemeData(
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20

        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.grey
    ),
    textTheme:TextTheme(
      bodyText1: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black54

      ),
      bodyText2: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange

      ),
      subtitle1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black54

      ),


    ),
    cardTheme: CardTheme(
        color: Colors.grey[300]
    )

);
ThemeData darkTheme =ThemeData(
    backgroundColor: Colors.black45,
    scaffoldBackgroundColor: Colors.black45,
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light
        ),
        backgroundColor: Colors.black38,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20

        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(

        backgroundColor: Colors.black26,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.grey
    ),
    textTheme:TextTheme(
      bodyText1: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white

      ),
      bodyText2: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange

      ),
      subtitle1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white

      ),


    ),
    cardTheme: CardTheme(
        color: Colors.deepOrangeAccent
    )

);