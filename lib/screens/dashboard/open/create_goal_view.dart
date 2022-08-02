
import 'package:done_app/constants/app_strings.dart';
import 'package:done_app/constants/app_styles.dart';
import 'package:done_app/constants/goal_icons.dart';
import 'package:done_app/extensions/context_extension.dart';
import 'package:done_app/extensions/widget_extension.dart';
import 'package:done_app/models/goal_model.dart';
import 'package:done_app/providers/goal_provider.dart';
import 'package:done_app/widgets/animated_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import 'create_goal_view_model.dart';

class CreateGoalView extends StatefulWidget {
  const CreateGoalView({Key? key}) : super(key: key);

  @override
  State<CreateGoalView> createState() => _CreateGoalViewState();
}

class _CreateGoalViewState extends CreateGoalViewModel {

  final goalTitleController = TextEditingController();
  final goalDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: rippleController, 
      builder: (context, child){
        return ClipPath(
          clipper: WaveClipper(value: rippleController.value),
          child: child,
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(AppStrings.goalAppBarTitle),
          leading: BackButton(onPressed: () => rippleController.reverse().then((value) => Navigator.pop(context))),
        ),
        body: _bodyView(),
      ),
    );
  }

  Widget _bodyView() {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              quickTags(),
              goalTitleTextField(),
              goalDescTextField(),
              selectIconButton(),
              selectGoalColor(),
            ],
          ),
          Column(
            children: [
              saveButton(),
              saveButton(),
            ],
          )
        ],
      ).wrapPadding(AppPaddings.all8),
    );
  }

  Widget quickTags() {
    return SizedBox(
      height: context.dynamicHeight(0.12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.quickTag, style: AppTextStyles.createGoalTitleStyle),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(AppStrings.quickTagsTitles.length, (index) => quickTagChip(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget quickTagChip(int index) {
    return Chip(
      label: Text(
        "#${AppStrings.quickTagsTitles[index]}",
        style: AppTextStyles.createGoalChipStyle(index)
      ),
      backgroundColor: AppColors.white,
      padding: AppPaddings.all8,
    ).wrapPadding(AppPaddings.right8);
  }

  Widget goalTitleTextField() {
    return SizedBox(
      height: context.dynamicHeight(0.14),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        Text(AppStrings.goalTextFieldTitle, style: AppTextStyles.createGoalTitleStyle),
        TextField(
          controller: goalTitleController,
          textCapitalization: TextCapitalization.words,
          decoration: AppDecorations.goalCreateInputDecor(AppStrings.goalHintText),
          onChanged: (String value){},
        ).wrapPadding(AppPaddings.top8),
       ],
      ),
    );
  }

  Widget goalDescTextField() {
    return SizedBox(
      height: context.dynamicHeight(0.14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.goalTextFieldDesc, style: AppTextStyles.createGoalTitleStyle),
          TextField(
            controller: goalDescController,
            textCapitalization: TextCapitalization.words,
            decoration: AppDecorations.goalCreateInputDecor(AppStrings.description),
            onChanged: (String value){},
          ).wrapPadding(AppPaddings.top8),
        ],
      ),
    );
  }

  Widget selectIconButton() {
    return SizedBox(
      width: double.infinity,
      height: context.dynamicHeight(0.065),
      child: ElevatedButton(
        onPressed: (){      
          AnimatedDialog.showSettingsDialog(
            context: context, 
            dialogPageContent: selectIconDialogView()
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(GoalIcons.goalIconList[selectedIconIndex]).wrapFitted(), 
            Text(AppStrings.selectIcon, style: AppTextStyles.generalTextStyle),
            Icon(Icons.chevron_right,size: 32,), 
          ],
        ),
      ),
    );
  }

  Widget selectIconDialogView() {
    return Container(
      height: context.dynamicHeight(0.6),
      width: context.dynamicWidth(0.8),
      color: AppColors.appBarBackground,
      child: Scrollbar(
        child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: GoalIcons.goalIconList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: (){
                setState(() {
                  selectedIconIndex = index;
                });
                Navigator.pop(context);
              },
              child: Icon(GoalIcons.goalIconList[index], color: AppColors.white, size: dialogIconSize,)
            );
          },
        ).wrapPadding(AppPaddings.vertical8)
      ),
    );
  }

  Widget selectGoalColor() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        childAspectRatio: 1
      ),
      itemCount: AppColors.goalColors.length,
      itemBuilder: (BuildContext context, int index) {
        return colorTile(index);
      },
    ).wrapPadding(AppPaddings.all4).wrapPadding(AppPaddings.top8);
  }

  Widget colorTile(int index){
    return InkWell(
      onTap: () {
        setState(() {
          selectedColorIndex = index;
        });
      },
      child: Stack(
        children: [
          SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppRadius.all8,
                color: AppColors.goalColors[index],
              ),
            ).wrapPadding(AppPaddings.all4),
          ),
          selectedColorIndex == index 
            ? Positioned.fill(child: Icon(Icons.task_alt, color: AppColors.white, size: 48).wrapAlign(Alignment.center)) 
            : SizedBox.shrink()
        ],
      ),
    );
  }

  Widget saveButton() {
    return SizedBox(
      width: double.infinity,
      height: context.dynamicHeight(0.060),
      child: ElevatedButton(
        onPressed: (){
          Goal goal = Goal(
            goalTitle: goalTitleController.text, 
            goalDescription: goalTitleController.text,
            goalIconData: GoalIcons.goalIconList[selectedIconIndex], 
            goalColor: AppColors.goalColors[selectedColorIndex],
          );
          context.read<GoalProvider>().addNewGoal(goal);
        }, 
        child: Text("Save", style: AppTextStyles.generalTextStyle)),
    ).wrapPadding(AppPaddings.top8);
  }
  
}

