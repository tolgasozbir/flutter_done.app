import 'package:done_app/constants/app_strings.dart';
import 'package:done_app/constants/app_styles.dart';
import 'package:done_app/constants/goal_icons.dart';
import 'package:done_app/extensions/context_extension.dart';
import 'package:done_app/extensions/widget_extension.dart';
import 'package:done_app/widgets/animated_dialog.dart';
import 'package:done_app/widgets/goal_widgets/quick_tags.dart';
import 'package:done_app/widgets/scaled_text.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../widgets/goal_widgets/title_with_textfield.dart';
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
              QuickTags(tagIndex: (index) => setQuickTag(index)),
              titleTextField(),
              descriptionTextField(),
              selectIconButton(),
              selectGoalColor(),
            ],
          ),
          Column(
            children: [
              saveButton(),
              cancelButton(),
            ],
          )
        ],
      ).wrapPadding(AppPaddings.all8),
    );
  }

  TitleWithTextField titleTextField() {
    return TitleWithTextField(
      titleText: AppStrings.goalTextFieldTitle, 
      hintText: AppStrings.goalHintText, 
      controller: goalTitleController
    );
  }

  TitleWithTextField descriptionTextField() {
    return TitleWithTextField(
      titleText: AppStrings.goalTextFieldDesc, 
      hintText: AppStrings.description, 
      controller: goalDescController
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
            Icon(GoalIcons.goalIconList[selectedIconIndex], size: selectIconSize).wrapFitted(), 
            ScaledText(text: AppStrings.selectIcon, style: AppTextStyles.generalTextStyle),
            Icon(Icons.chevron_right,size: selectIconSize), 
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
            crossAxisCount: 4,
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
              child: Icon(GoalIcons.goalIconList[index], color: AppColors.white, size: dialogIconSize)
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
        crossAxisCount: 6,
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
    print(context.dynamicWidth(1));
    print(context.dynamicHeight(1)); 
    print(18 * (context.dynamicWidth(1)/3)/100); //TODO .SP 
    //TODO: FAZLA TEXTLER OVERFLOW VERİYOR YA KISITLA YA DA OVERFLOWU ÇÖZ
    //TODO: HABİT TİLE ZAMAN SEÇMEDE SORUN VAR YANLIŞ SEÇİYOR
    //TODO GOAL VİEW DE TEXTLER KÜÇÜK ONUN İÇİN AYRIBİRŞEY YAP

    return SizedBox(
      width: double.infinity,
      height: context.dynamicHeight(0.060),
      child: ElevatedButton(
        onPressed: addGoal, 
        child: ScaledText(text: AppStrings.save, style: AppTextStyles.generalTextStyle)),
    );
  }  
  
  Widget cancelButton() {
    return SizedBox(
      width: double.infinity,
      height: context.dynamicHeight(0.060),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.cancelRed,
        ),
        onPressed: animateAndPop, 
        child: ScaledText(text: AppStrings.cancel, style: AppTextStyles.generalTextStyle)),
    ).wrapPadding(AppPaddings.top8);
  }
  
}


