import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'taskmodel.g.dart';

@HiveType(typeId: 1)
class Task {
  Task({required this.name, required this.checked});

  @HiveField(2)
  String name;

  @HiveField(3)
  bool checked;

  @override
  String toString() {
    return 'List: {name: ${name}, checked: ${checked}}';
  }
}
