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
      goalCompletionPercentage: fields[2] as double,
      goalIconDataIndex: fields[3] as int,
      goalColorIndex: fields[4] as int,
      goalIsComplete: fields[5] as bool,
    )..tasks = (fields[6] as List).cast<Task>();
  }

  @override
  void write(BinaryWriter writer, Goal obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.goalTitle)
      ..writeByte(1)
      ..write(obj.goalDescription)
      ..writeByte(2)
      ..write(obj.goalCompletionPercentage)
      ..writeByte(3)
      ..write(obj.goalIconDataIndex)
      ..writeByte(4)
      ..write(obj.goalColorIndex)
      ..writeByte(5)
      ..write(obj.goalIsComplete)
      ..writeByte(6)
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

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 3;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      taskTitle: fields[0] as String,
      isComplete: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.taskTitle)
      ..writeByte(1)
      ..write(obj.isComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
