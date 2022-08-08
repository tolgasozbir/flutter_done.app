import 'package:done_app/providers/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/app_colors.dart';
import 'constants/app_strings.dart';
import 'package:provider/provider.dart';
import 'providers/habit_provider.dart';
import 'routes/app_router.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => HabitProvider())),
      ChangeNotifierProvider(create: ((context) => GoalProvider())),
    ],
    child: MyApp(),
  ));
  _portraitModeOnly();
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key); 

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(      
      routerDelegate: _appRouter.delegate(),      
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.appBarBackground
        ),
        scaffoldBackgroundColor: AppColors.scaffoldBackground
      ),
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
    );
  }
}