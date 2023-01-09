import 'package:fitbody_flutter/models/record.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  var records = <Record>[].obs;

  void addRecord(Record record) {
    records.add(record);
  }

  void deleteRecord(Record record) {
    records.remove(record);
  }
}
