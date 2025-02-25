import 'package:flutter/material.dart';
import 'package:booking/screens/splash_screen.dart';
import 'package:booking/screens/welcome_screen.dart';
import 'package:booking/screens/sign_up_screen.dart';
import 'package:booking/screens/sign_in_screen.dart';
import 'package:booking/screens/home_screen.dart';
import 'package:booking/screens/details_form_screen.dart';
import 'package:booking/screens/hotel_list_screen.dart'; // New import for hotel list screen

class Routes {
  static const String splash = "/";
  static const String welcome = "/welcome";
  static const String signUp = "/signUp";
  static const String signIn = "/signIn";
  static const String home = "/home";
  static const String detailsForm = "/detailsForm";
  static const String hotelList = "/hotelList"; // New route constant

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case detailsForm:
        return MaterialPageRoute(builder: (_) => DetailsFormScreen());
      case hotelList:
        // Expecting settings.arguments to be a Map with keys: 'destination', 'checkIn', 'checkOut', 'rooms'
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => HotelListScreen(
            destination: args['destination'],
            checkIn: args['checkIn'],
            checkOut: args['checkOut'],
            rooms: args['rooms'],
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
    }
  }
}
