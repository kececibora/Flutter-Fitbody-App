import 'package:fitbody_flutter/getx-weightTrack/controller.dart';
import 'package:fitbody_flutter/widgets/record_list_tile_weight.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RealHistoryScreen extends StatefulWidget {
  const RealHistoryScreen({super.key});

  @override
  State<RealHistoryScreen> createState() => _RealHistoryScreenState();
}

class _RealHistoryScreenState extends State<RealHistoryScreen> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            leading: BackButton(color: Colors.amber),
            centerTitle: true,
            title: Text(
              "Kilo",
              style: TextStyle(color: Colors.amber),
            ),
          ),
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
