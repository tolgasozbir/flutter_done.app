// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitAdapter extends TypeAdapter<Habit> {
  @override
  final int typeId = 1;

  @override
  Habit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Habit(
      habitTitle: fields[0] as String,
      elapsedTime: fields[1] as int,
      timeGoal: fields[2] as int,
      isStarted: fields[5] as bool,
      startTime: fields[6] as DateTime?,
      hours: fields[4] as int,
      mins: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Habit obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.habitTitle)
      ..writeByte(1)
      ..write(obj.elapsedTime)
      ..writeByte(2)
      ..write(obj.timeGoal)
      ..writeByte(3)
      ..write(obj.mins)
      ..writeByte(4)
      ..write(obj.hours)
      ..writeByte(5)
      ..write(obj.isStarted)
      ..writeByte(6)
      ..write(obj.startTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
