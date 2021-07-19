import 'package:hive/hive.dart';

class Repository<T> {
  Box<T> db;

  Future init() async {
    await Hive.openBox<T>(T.toString().toLowerCase()).then((value) {
      db = value;
    });
  }

  T getData(id) {
    return db.get(id);
  }

  List<T> getAll() {
    return db.values;
  }

  Future<bool> add(T value) async {
    return await db.add(value) > 0;
  }

  Future delete(key) async {
    return db.delete(key);
  }

  Future update(index, T value) async {
    return await db.put(index, value);
  }
}
