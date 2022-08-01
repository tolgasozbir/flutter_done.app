import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashViewModel {
  
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