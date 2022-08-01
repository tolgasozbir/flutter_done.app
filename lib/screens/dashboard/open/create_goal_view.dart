
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
        appBar: AppBar(
          title: Text("Create your goal"),
          leading: BackButton(onPressed: () => rippleController.reverse().then((value) => Navigator.pop(context))),
        ),
        body: _bodyView(),
      ),
    );
  }

  Widget _bodyView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Quick tag", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xBB000000))),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(10, (index) => chip(index)),
          ),
        ),
        SizedBox(height: 24,),
        Text("Set your goal title", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xBB000000))),
        SizedBox(height: 8,),
        TextField(
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
            ),
            hintText: "Meditate, Workout, etc",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))
            )
          ),
          onChanged: (String value){
            
          },
        ),        
        SizedBox(height: 24,),
        Text("Need a description?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xBB000000))),
        SizedBox(height: 8,),
        TextField(
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
            ),
            hintText: "Description",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))
            )
          ),
          onChanged: (String value){
            
          },
        ),
      SizedBox(height: 24,),

      SizedBox(
        width: double.infinity,
        child: ElevatedButton(onPressed: (){
          
          AnimatedDialog.showSettingsDialog(
            context: context, 
            dialogPageContent:  Container(
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
              ).wrapPadding(AppPaddings.dialogContentPadding),
            )
          );

        }, child: Text("Select Icon")),
      ),

      Container(
        width: double.infinity,
        color: Colors.grey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => SizedBox.square(
                  dimension: context.dynamicWidth(1)/6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.primaries[index%17]
                    )
                  ),
                ).wrapPadding(AppPaddings.all4))
            ),Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => SizedBox.square(
                  dimension: context.dynamicWidth(1)/6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.primaries[index%17]
                    )
                  ),
                ).wrapPadding(AppPaddings.all4))
            )
          ],
        ),
      ),

      SizedBox(
        width: double.infinity,
        child: ElevatedButton(onPressed: (){}, child: Text("Save")))


      ],
    ).wrapPadding(AppPaddings.all8);
  }

  Widget chip(int index) {
    return Chip(
      label: Text("#Workout",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.primaries[index%Colors.primaries.length] )),
      backgroundColor: Colors.white,
      padding: EdgeInsets.all(8),
    ).wrapPadding(EdgeInsets.only(right: 8));
  }
}

