import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'constants/app_strings.dart';
import 'screens/splash_view.dart';
import 'package:provider/provider.dart';
import 'providers/habit_provider.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => HabitProvider())),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.appBarBackground
        ),
        scaffoldBackgroundColor: AppColors.scaffoldBackground
      ),
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      home: SplashView()
    );
  }
}