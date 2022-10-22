import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashViewModel {

  final String lottiePath = 'assets/lottie/lottie_loading.json';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _bodyView(),
    );
  }

  Widget _bodyView() {
    return SafeArea(
      child: Center(
        child: Lottie.asset(lottiePath)
      ),
    );
  }
}