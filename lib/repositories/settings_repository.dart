import 'package:hive_flutter/hive_flutter.dart';

class SettingsResposity {
  final Box _box;
  SettingsResposity._(Box box) : _box = box;

  static Future<SettingsResposity> create() async {
    var box = await Hive.openBox('settings');
    return SettingsResposity._(box);
  }

  set lastUpdated(v) => _box.put('lastUpdated', v);
  DateTime get lastUpdated => _box.get('lastUpdated',
      defaultValue: DateTime.fromMicrosecondsSinceEpoch(0)) as DateTime;
}
