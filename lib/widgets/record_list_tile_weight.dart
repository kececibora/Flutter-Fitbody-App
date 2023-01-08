import 'package:fitbody_flutter/getx-weightTrack/controller.dart';
import 'package:fitbody_flutter/models/record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecordListTile extends StatelessWidget {
  final Record record;
  RecordListTile({super.key, required this.record});
  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
        child: ListTile(
          title: Center(
              child: Text(
            "${record.weight}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )),
          leading: dateFormat(),
          trailing: cardIcons(),
        ),
      ),
    );
  }

  Text dateFormat() => Text(DateFormat("EEE,MMM d, ").format(record.dateTime));
  Row cardIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: Colors.grey,
            )),
        IconButton(
            onPressed: () {
              _controller.deleteRecord(record);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ))
      ],
    );
  }
}
