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
      appBar: AppBar(
        leading: BackButton(color: Colors.amber),
        centerTitle: true,
        title: Text(
          "Ölçüm Ekle",
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: Column(children: [
        Card(
          child: Text("Deneme"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        Card(
          child: Text("Deneme"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        Card(
          child: Text("Deneme"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("Kaydet"),
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ]),
    );
  }
}
