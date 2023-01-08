import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AddRecordView extends StatefulWidget {
  const AddRecordView({super.key});

  @override
  State<AddRecordView> createState() => _AddRecordViewState();
}

class _AddRecordViewState extends State<AddRecordView> {
  int _selectedValue = 70;
  DateTime _selectedDate = DateTime.now();

  void pickDate(BuildContext context) async {
    //datepicker show
    var initialDate = DateTime.now();
    _selectedDate = await showDatePicker(
            builder: (context, child) {
              return Theme(
                data: ThemeData.dark().copyWith(
                    colorScheme: ColorScheme(
                        brightness: Brightness.light,
                        primary: Colors.black,
                        onPrimary: Colors.yellow,
                        secondary: Colors.black,
                        onSecondary: Colors.black,
                        error: Colors.black,
                        onError: Colors.black,
                        background: Colors.black,
                        onBackground: Colors.yellow,
                        surface: Colors.yellow,
                        onSurface: Colors.white)),
                child: child ?? Text(''),
              );
            },
            context: context,
            initialDate: _selectedDate,
            firstDate: DateTime(2000),
            lastDate: initialDate.add(Duration(days: 0))) ??
        _selectedDate;
    setState(() {});
  }

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
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Icon(
                  color: Colors.amber,
                  Icons.monitor_weight,
                  size: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NumberPicker(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber),
                            borderRadius: BorderRadius.circular(8)),
                        itemCount: 5,
                        itemWidth: 50,
                        itemHeight: 50,
                        axis: Axis.horizontal,
                        minValue: 30,
                        maxValue: 200,
                        value: _selectedValue,
                        onChanged: (e) {
                          setState(() {
                            _selectedValue = e;
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        GestureDetector(
          onTap: () {
            pickDate(context);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Icon(
                    color: Colors.amber,
                    Icons.date_range,
                    size: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('EEE,MMM d').format(_selectedDate),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
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
