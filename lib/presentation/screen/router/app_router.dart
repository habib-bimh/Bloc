// import 'package:counter_bloc/logic/cubit/counter_cubit.dart';
import 'package:counter_bloc/presentation/screen/dashboard.dart';
import 'package:counter_bloc/presentation/screen/secend_screen.dart';
import 'package:counter_bloc/presentation/screen/third_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class AppRout {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
     return   MaterialPageRoute(
            builder: (_) => const MyHomePage());

        // break;
      case "/second":
     return   MaterialPageRoute(
            builder: (_) => const SecendScreen());
        // break;

      case "/third":
     return   MaterialPageRoute(
            builder: (_) => const ThirdScreen());

        // break;
      default:
        return null;
    }
    
    
  }
}
