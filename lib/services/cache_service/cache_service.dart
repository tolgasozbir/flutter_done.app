import 'package:hive/hive.dart';

abstract class ICacheService<T> {
  final String boxName;
  Box<T>? box;

  ICacheService(this.boxName);

  Future<void> init() async {
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox(boxName);
    }
  }

  List<T>? getValues() {
    return box?.values.toList();
  }

  Future<void> clearAll() async {
    await box?.clear();
  }

  Future<void> closeBox() async {
    await box?.close();
  }
  
  void registerAdapters();
  Future<void> addItems(List<T> items);
  Future<void> addItem(T item);
  Future<void> putItems(List<T> items);
  Future<void> putItem(String key, T item);
  T? getItem(String key);
  Future<void> removeItem(String key);

}