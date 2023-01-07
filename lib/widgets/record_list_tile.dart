import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordListTile extends StatelessWidget {
  const RecordListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(DateFormat("EEE,MMM d").format(DateTime.now())),
      title: Text("75"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Colors.grey,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
