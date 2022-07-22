import 'package:flutter/material.dart';
import 'package:habit_tracker/home_view.dart';
import 'package:provider/provider.dart';
import 'providers/habit_provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => HabitProvider())),
    ],
    child: MyApp(),
  ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.grey.shade900
        ),
        scaffoldBackgroundColor: Colors.grey.shade300
      ),
      debugShowCheckedModeBanner: false,
      title: 'Habit Tracker',
      home: SafeArea(child: HomeView())
    );
  }
}