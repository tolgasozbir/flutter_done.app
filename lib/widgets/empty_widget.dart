import '../constants/app_strings.dart';
import '../constants/app_styles.dart';
import 'scaled_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum EmptyLottie { astronaut1, astronaut2 }

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key, required this.emptyLottie, this.text = AppStrings.noData}) : super(key: key);

  final EmptyLottie emptyLottie;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/lottie/lottie_${emptyLottie.name}.json'),
        ScaledText(text: text, style: AppTextStyles.boldCustomSize(fontSize: 22)),
      ],
    );
  }
}