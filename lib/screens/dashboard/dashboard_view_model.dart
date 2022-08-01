import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../constants/app_strings.dart';
import 'dashboard_view.dart';

abstract class DashboardViewModel extends State<DashboardView> {

  int currentTitleIndex = 0;

  @override
  void initState() {
    super.initState();
    timerTitleChanger();
  }

  void timerTitleChanger(){
    final rnd = Random();
    currentTitleIndex = rnd.nextInt(AppStrings.quotations.length);
    Timer.periodic(Duration(seconds: 30), (timer){
      setState(() => currentTitleIndex = rnd.nextInt(AppStrings.quotations.length));
    });
  }
  
}