import 'package:flutter/material.dart';
import '../providers/habit_provider.dart';
import 'home_view.dart';
import '../utilities/route_helper.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../services/notification_service/local_notification_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  
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
    });
    
    await Future.delayed(Duration(milliseconds: 2400), (){
      RouteHelper.goRouteRemoveUntilFade(context: context, page: HomeView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _bodyView()),
    );
  }

  Widget _bodyView() {
    return Center(
      child: Lottie.asset('assets/lottie/lottie_loading.json')
    );
  }
}