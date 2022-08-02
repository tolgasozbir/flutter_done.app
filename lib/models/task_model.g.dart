// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 2;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      taskTitle: fields[0] as String,
      taskDescription: fields[1] as String,
      taskCount: fields[2] as int,
      taskCompletionPercentage: fields[3] as double,
      taskIconData: fields[4] as IconData,
      taskColor: fields[5] as Color,
      isComplete: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.taskTitle)
      ..writeByte(1)
      ..write(obj.taskDescription)
      ..writeByte(2)
      ..write(obj.taskCount)
      ..writeByte(3)
      ..write(obj.taskCompletionPercentage)
      ..writeByte(4)
      ..write(obj.taskIconData)
      ..writeByte(5)
      ..write(obj.taskColor)
      ..writeByte(6)
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
