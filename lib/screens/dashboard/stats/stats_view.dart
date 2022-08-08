import 'package:done_app/constants/app_strings.dart';
import 'package:done_app/extensions/widget_extension.dart';
import 'package:done_app/extensions/context_extension.dart';
import 'package:done_app/screens/dashboard/stats/charts.dart';
import 'package:done_app/widgets/scaled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/app_styles.dart';
import '../../../providers/goal_provider.dart';
import '../../../widgets/goal_widgets/circular_arc_progress.dart';

class StatsView extends StatefulWidget {
  const StatsView({Key? key}) : super(key: key);

  @override
  State<StatsView> createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          ScaledText(text: AppStrings.statistics, style: AppTextStyles.boldCustomSize(fontSize: 32)),
          statisticsContainer(context),
        ],
      ).wrapPadding(AppPaddings.all16),
    );
  }

  Widget statisticsContainer(BuildContext context){
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: context.dynamicHeight(0.64),
          child: arcProgress(context)
        ),
        Positioned(
          //bottom: context.dynamicHeight(0.64),
          child: ScaledText(text: AppStrings.statsInfo, style: AppTextStyles.boldCustomSize(fontSize: 18))
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
            width: context.dynamicWidth(1),
            height: context.dynamicHeight(0.3),
            child: const Charts()
          )
        )
      ],
    );
  }

  Widget arcProgress(BuildContext context) {
    return CircularArc(
      textStyle: AppTextStyles.boldCustomSize(fontSize: context.dynamicWidth(0.20)),
      strokeWidth: context.dynamicWidth(0.1),
      size: context.dynamicWidth(0.64),
      progressPercent: context.watch<GoalProvider>().calculateStatsCompletePercent(),
      progressColor: Colors.amber, //ingored
      isGraident: true,
    ).wrapAlign(Alignment.topCenter).wrapPadding(AppPaddings.all16);
  }
}