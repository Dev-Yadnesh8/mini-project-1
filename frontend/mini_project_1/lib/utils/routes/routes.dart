import 'package:flutter/material.dart';
import 'package:mini_project_1/utils/routes/route_names.dart';
import 'package:mini_project_1/view/home/home_screen.dart';
import 'package:mini_project_1/view/user_auth/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings){
    switch (routeSettings.name) {
       case RouteNames.login:
      return MaterialPageRoute(builder: (context) =>  LoginScreen(),);
      case RouteNames.home:
      return MaterialPageRoute(builder: (context) =>  HomeScreen(),);
      
      default:
      return MaterialPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text("No route defined"),
          ),
        );
      },);
    }
  }
  
}