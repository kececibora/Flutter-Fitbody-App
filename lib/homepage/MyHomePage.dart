import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fitbody_flutter/getx-weightTrack/add_record.dart';
import 'package:fitbody_flutter/getx-weightTrack/graph_history.dart';
import 'package:fitbody_flutter/getx-weightTrack/workout.dart';
import 'package:fitbody_flutter/getx-weightTrack/graph.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;
  Widget _currentScreen = GraphScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.backspace_outlined, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          "FitBody",
          style: TextStyle(color: Colors.amber),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.history,
              color: Colors.amber,
            ),
            onPressed: () {
              Get.to(() => RealHistoryScreen());
              // do something
            },
          )
        ],
      ),
      body: _currentScreen, //destination screen
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => AddRecordView());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          height: Get.height / 10,
          activeColor: Colors.yellow,
          inactiveColor: Colors.white,
          icons: [Icons.fitness_center, Icons.show_chart],
          iconSize: 35,
          activeIndex: _currentPageIndex,
          gapLocation: GapLocation.center,
          backgroundColor: Colors.black,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 20,
          rightCornerRadius: 20,
          onTap: (p0) {
            setState(() {
              _currentPageIndex = p0;
              _currentScreen = (p0 == 0) ? GraphScreen() : HistoryScreen();
            });
          }),
      //other params
    );
  }
}
