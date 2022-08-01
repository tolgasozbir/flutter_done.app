
import 'package:done_app/constants/app_strings.dart';
import 'package:done_app/constants/app_styles.dart';
import 'package:done_app/extensions/context_extension.dart';
import 'package:done_app/extensions/widget_extension.dart';
import 'package:done_app/widgets/animated_dialog.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import 'create_goal_view_model.dart';

class CreateGoalView extends StatefulWidget {
  const CreateGoalView({Key? key}) : super(key: key);

  @override
  State<CreateGoalView> createState() => _CreateGoalViewState();
}

class _CreateGoalViewState extends CreateGoalViewModel {
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
          title: Text("Create your goal"),
          leading: BackButton(onPressed: () => rippleController.reverse().then((value) => Navigator.pop(context))),
        ),
        body: _bodyView(),
      ),
    );
  }

  Widget _bodyView() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          quickTags(),
          Spacer(flex: 2,),
          goalTitleTextField(),
          Spacer(flex: 3,),
          goalDescTextField(),
          Spacer(),
          selectIconButton(),
          selectTaskColor(),
          Spacer(),
          saveButton(),
          saveButton()
        ],
      ).wrapPadding(AppPaddings.all8),
    );
  }

  Column quickTags() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.quickTag, style: AppTextStyles.createTaskTitleStyle),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(AppStrings.quickTagsTitles.length, (index) => quickTagChip(index)),
          ),
        ),
      ],
    );
  }

  Widget quickTagChip(int index) {
    return Chip(
      label: Text(
        "#${AppStrings.quickTagsTitles[index]}",
        style: AppTextStyles.createTaskChipStyle(index)
      ),
      backgroundColor: AppColors.white,
      padding: AppPaddings.all8,
    ).wrapPadding(AppPaddings.right8);
  }

  Column goalTitleTextField() {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Text(AppStrings.taskTextFieldTitle, style: AppTextStyles.createTaskTitleStyle),
       TextField(
         textCapitalization: TextCapitalization.words,
         decoration: AppDecorations.taskCreateInputDecor(AppStrings.taskHintText),
         onChanged: (String value){},
       ).wrapPadding(AppPaddings.top8),
     ],
    );
  }

  Column goalDescTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.taskTextFieldDesc, style: AppTextStyles.createTaskTitleStyle),
        TextField(
          textCapitalization: TextCapitalization.words,
          decoration: AppDecorations.taskCreateInputDecor(AppStrings.description),
          onChanged: (String value){},
        ),
      ],
    );
  }

  SizedBox selectIconButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){      
          AnimatedDialog.showSettingsDialog(
            context: context, 
            dialogPageContent: selectIconDialogView()
          );
        },
        child: Text(AppStrings.selectIcon)
      ),
    );
  }

  Container selectIconDialogView() {  //TODO: ayarlancak
    return Container(
      height: context.dynamicHeight(0.6),
      width: context.dynamicWidth(0.8),
      color: AppColors.appBarBackground,
      child: SizedBox(
        child: Scrollbar(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return Icon(Icons.add_box_sharp, color: Colors.grey,);
            },
          ),
        ),
      ).wrapPadding(AppPaddings.all16),
    );
  }

  Container selectTaskColor() {
    return Container(
      width: double.infinity,
      color: AppColors.selectColorsGrayBg,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
        itemCount: AppColors.taskColors.length,
        itemBuilder: (BuildContext context, int index) {
          return colorTile(index);
        },
      ).wrapPadding(AppPaddings.all4),
    );
  }

  Widget colorTile(int index){
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.taskColors[index],
      )
    ).wrapPadding(AppPaddings.all4);
  }

  SizedBox saveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: (){}, child: Text("Save"))
    );
  }
  
}

