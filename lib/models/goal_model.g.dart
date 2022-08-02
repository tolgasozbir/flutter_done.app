// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalAdapter extends TypeAdapter<Goal> {
  @override
  final int typeId = 2;

  @override
  Goal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Goal(
      goalTitle: fields[0] as String,
      goalDescription: fields[1] as String,
      taskCount: fields[2] as int,
      goalCompletionPercentage: fields[3] as double,
      goalIconData: fields[4] as IconData,
      goalColor: fields[5] as Color,
      isComplete: fields[6] as bool,
    )..tasks = (fields[7] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, Goal obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.goalTitle)
      ..writeByte(1)
      ..write(obj.goalDescription)
      ..writeByte(2)
      ..write(obj.taskCount)
      ..writeByte(3)
      ..write(obj.goalCompletionPercentage)
      ..writeByte(4)
      ..write(obj.goalIconData)
      ..writeByte(5)
      ..write(obj.goalColor)
      ..writeByte(6)
      ..write(obj.isComplete)
      ..writeByte(7)
      ..write(obj.tasks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
