import 'package:counter_bloc/logic/cubit/counter_cubit.dart';
import 'package:counter_bloc/presentation/screen/router/app_router.dart';
// import 'package:counter_bloc/presentation/screen/secend_screen.dart';
// import 'package:counter_bloc/presentation/screen/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'logic/cubit/counter_cubit.dart';
// import 'presentation/screen/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final AppRout _appRout = AppRout();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (_)=>CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _appRout.onGenerateRoute,
      ),
    );
    
  }

}


