import 'package:done_app/extensions/context_extension.dart';
import 'package:done_app/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../constants/goal_icons.dart';

class IconSelectDialogView extends StatelessWidget {
  const IconSelectDialogView({Key? key, required this.iconIndexCallback}) : super(key: key);

  final double iconSize = 48;
  final void Function(int index) iconIndexCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.6),
      width: context.dynamicWidth(0.8),
      color: AppColors.appBarBackground,
      child: Scrollbar(
        child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: GoalIcons.goalIconList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                iconIndexCallback.call(index);
                Navigator.pop(context);
              },
              child: Icon(GoalIcons.goalIconList[index], color: AppColors.white, size: iconSize)
            );
          },
        ).wrapPadding(AppPaddings.vertical8)
      ),
    );
  }
}