import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/view/home_screen.dart';
import 'package:flutter_mvvm_architecture/view/login_screen.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings setting){
    switch(setting.name){
      case RoutesName.login :
        return MaterialPageRoute(builder: (BuildContext context) => LoginScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
        default:
          return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No route Defined"),
            ),
          );
        }
        );
    }
  }
}