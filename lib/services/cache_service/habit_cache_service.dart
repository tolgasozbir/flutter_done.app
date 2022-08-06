import '../../models/habit_model.dart';
import 'cache_service.dart';
import 'package:hive_flutter/adapters.dart';
import '../../constants/hive_constants.dart';

class HabitCacheService extends ICacheService<Habit> {
  HabitCacheService(super.boxName);

  @override
  Habit? getItem(String key) {
    return box?.get(key);
  }

  @override
  Future<void> putItem(String key, item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> putItems(List<Habit> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.habitTitle, e))));
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.habitTypeId)) {
      Hive.registerAdapter(HabitAdapter());
    }
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

}