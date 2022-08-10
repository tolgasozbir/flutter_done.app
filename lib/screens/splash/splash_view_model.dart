import 'package:auto_route/auto_route.dart';
import '../../providers/goal_provider.dart';
import 'package:flutter/material.dart';
import 'splash_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../../providers/habit_provider.dart';
import '../../routes/app_router.dart';
import '../../services/notification_service/local_notification_service.dart';

abstract class SplashViewModel extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    WidgetsFlutterBinding.ensureInitialized();

    LocalNotificationService.instance.init();

    await Hive.initFlutter();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var habitProvider = Provider.of<HabitProvider>(context, listen: false);
      await habitProvider.initCacheService();

      var goalProvider = Provider.of<GoalProvider>(context, listen: false);
      await goalProvider.initCacheService();
    });
    
    _navigateToDashboard();
  }

  void _navigateToDashboard() async {
    await Future.delayed(const Duration(milliseconds: 2400), (){
      context.router.replace(const DashboardRoute());
    });
  } 

}