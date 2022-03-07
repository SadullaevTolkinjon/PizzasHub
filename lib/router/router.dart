import 'package:flutter/material.dart';
import 'package:pizzadeeserts/model/bascet_model.dart';
import 'package:pizzadeeserts/pages/bascet_page.dart';
import 'package:pizzadeeserts/pages/dessert_page.dart';
import 'package:pizzadeeserts/pages/home_page.dart';
import 'package:pizzadeeserts/pages/info_page.dart';
import 'package:pizzadeeserts/pages/pizza_page.dart';
import 'package:pizzadeeserts/pages/signup/firstpage.dart';
import 'package:pizzadeeserts/pages/signup/login.dart';
import 'package:pizzadeeserts/pages/signup/signupwith.dart';
import 'package:pizzadeeserts/pages/signup/signupwithemail.dart';

class GenerateRouterr {
  static routerGenerator(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (context) => const HomePAge());
      case "/pizza":
        return MaterialPageRoute(builder: (context) => const PizzaPage());
      case "/desert":
        return MaterialPageRoute(builder: (context) =>  DessertPage());
      case "/first":
        return MaterialPageRoute(builder: (context) => const FirstPage());
      case "/signup":
        return MaterialPageRoute(builder: (context) => const SignUpWith());
      case "/email":
        return MaterialPageRoute(builder: (context) => SignUpWithEmail());
      case "/login":
        return MaterialPageRoute(
          builder: (context) =>  LoginPage(),
        );
              case "/bascet":
        return MaterialPageRoute(builder: (context) => MyBascetPage());
        case "/info":
        return MaterialPageRoute(builder: (context) => InfoPAge(data: args,));
    }
  }
}
