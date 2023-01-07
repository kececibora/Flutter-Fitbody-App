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
    return Scaffold(
        body: ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Text(_controller.records[0].note!),
        Text(_controller.records[1].note!),
        Text(_controller.records[2].note!)
      ],
    ));
  }
}
