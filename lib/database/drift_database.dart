import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../model/category_color.dart';
import '../model/schedule.dart';
import 'package:path/path.dart' as p;

// part - private 값까지 불러 올 수 있다.
// g - generate
part 'drift_database.g.dart';


@DriftDatabase(
  tables: [
    Schedules,
    CategoryColors,
  ],
)
// _$LocalDatabase의 경우 drift_database.g.dart에 생성된다.
// part로 불러오기 때문에 private class 를 상속 받을 수 있다.
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());
  //primary key 값 return
  Future<int> createSchedule(SchedulesCompanion data) => 
      into(schedules).insert(data);
  
  Future<int> createCategoryColor(CategoryColorsCompanion data) =>
      into(categoryColors).insert(data);
  
  Future<List<CategoryColor>> getCategoryColors() =>
      select(categoryColors).get();

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFoloder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFoloder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}