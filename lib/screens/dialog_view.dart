import 'package:flutter/material.dart';
import 'package:habit_tracker/models/habit_model.dart';

import '../constants/app_colors.dart';
import '../widgets/list_wheel.dart';

class DialogView extends StatefulWidget {
  const DialogView({
    Key? key, 
    required this.habit
  }) : super(key: key);

  final Habit habit;

  @override
  State<DialogView> createState() => _DialogViewState();
}

class _DialogViewState extends State<DialogView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _bodyView();
  }

  Widget _bodyView() {
    return StatefulBuilder(
      builder: (context, setState) => Container(
        height: MediaQuery.of(context).size.height*0.56,
        width: MediaQuery.of(context).size.width*0.72,
        color: AppColors.appBarBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              habitTitleTextField(),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 32, 8, 0),
                child: Text("Goal time for this habit",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
              listWheels(),
              saveButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget habitTitleTextField() {
    return TextFormField(
      initialValue: widget.habit.habitTitle,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
      ),
    );
  }

  Expanded listWheels() {
    return Expanded(
            child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade700,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                        height: 32,
                        width: double.infinity,
                      ),
                    Row(
                      children: [
                        Spacer(),
                        Expanded(flex: 2, child: ListWheel(itemCount: 24)),
                        Expanded(flex: 2, child: Text("hrs",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                        Expanded(flex: 2, child: ListWheel(itemCount: 60,value: widget.habit.timeGoal.toDouble())),
                        Expanded(flex: 2, child: Text("mins",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                        Spacer()
                      ],
                    ),
                  ],
                ), 
            );
  }

  Widget saveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (){}, 
        child: Text("Save")
        )
      );
  }
}