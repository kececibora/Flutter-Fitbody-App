import 'package:flutter/material.dart';

import '../../widgets/record_list_tile.dart';

class WeightHistory extends StatelessWidget {
  const WeightHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          RecordListTile(),
          RecordListTile(),
          RecordListTile(),
          RecordListTile(),
        ],
      ),
    );
  }
}
