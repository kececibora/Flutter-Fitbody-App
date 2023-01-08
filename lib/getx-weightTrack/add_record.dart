import 'package:flutter/material.dart';

class AddRecordView extends StatefulWidget {
  const AddRecordView({super.key});

  @override
  State<AddRecordView> createState() => _AddRecordViewState();
}

class _AddRecordViewState extends State<AddRecordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        )
      ]),
    );
  }
}
