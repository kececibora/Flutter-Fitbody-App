import 'package:fitbody_flutter/getx-weightTrack/controller.dart';
import 'package:fitbody_flutter/widgets/record_list_tile_weight.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: _controller.records.isEmpty
              ? Center(
                  child: Container(
                    child: Text(
                      "Lütfen Kayıt Yapınız!",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                )
              : ListView(
                  physics: BouncingScrollPhysics(),
                  children: _controller.records
                      .map((record) => RecordListTile(record: record))
                      .toList(),
                ),
        ));
  }
}
