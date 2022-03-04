import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:series_app/bloc/game_bloc.dart';
import 'package:series_app/repository/game_api_services.dart';
import 'package:series_app/screens/home_screen.dart';

void main() {
  runApp(BlocProvider<GameBloc>
  ( create: (context) => GameBloc( GameApi()),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
    
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
