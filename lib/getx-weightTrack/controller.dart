import 'package:fitbody_flutter/models/record.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var records = <Record>[
    Record(weight: 90, dateTime: DateTime.now(), note: "AAA"),
    Record(weight: 88, dateTime: DateTime.now(), note: "BBB"),
    Record(weight: 77, dateTime: DateTime.now(), note: "CCC"),
    Record(weight: 66, dateTime: DateTime.now(), note: "DDD"),
  ].obs;

  void addRecord() {
    records.add(Record(weight: 90, dateTime: DateTime.now(), note: "XXX"));
    print(records.length);
  }

  void deleteRecord(Record record) {
    records.remove(record);
  }
}
