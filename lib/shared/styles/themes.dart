import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mk/shared/styles/colors.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: defaultColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: defaultColor,
        type: BottomNavigationBarType.fixed),
    appBarTheme: AppBarTheme(
        titleSpacing: 20.0,
        backwardsCompatibility: false,
        iconTheme: IconThemeData(color: Colors.black, size: 30.0),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),
        elevation: 0.0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.0)),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w800, color: Colors.black)));
ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: HexColor('333739'),
    primarySwatch: Colors.deepOrange,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor('333739'),
        selectedItemColor: Colors.deepOrange,
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        type: BottomNavigationBarType.fixed),
    appBarTheme: AppBarTheme(
        titleSpacing: 20.0,
        backwardsCompatibility: false,
        iconTheme: IconThemeData(color: Colors.white, size: 30.0),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: HexColor('333739')),
        elevation: 0.0,
        backgroundColor: HexColor('333739'),
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0)),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w800, color: Colors.white)));

// appBarTheme: AppBarTheme(
// titleSpacing: 20.0,
// backwardsCompatibility: false,
// systemOverlayStyle: SystemUiOverlayStyle(
// statusBarColor: Colors.white,
// statusBarIconBrightness: Brightness.dark,
// ),
// backgroundColor: Colors.white,
// elevation: 0.0,
// titleTextStyle: TextStyle(
// color: Colors.black,
// fontSize: 20.0,
// fontWeight: FontWeight.bold,
// ),
// iconTheme: IconThemeData(
// color: Colors.black,
// ),
// ),
