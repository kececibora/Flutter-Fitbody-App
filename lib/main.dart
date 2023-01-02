import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fitbody_flutter/Kisiler.dart';
import 'package:fitbody_flutter/KisilerCevap.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Kisiler> parseKisilerCevap(String cevap) {
    // var jsonVeri = json.decode(cevap);
    // var kisilerCevap = KisilerCevap.fromJson(jsonVeri);
    // List<Kisiler> kisilerListesi = kisilerCevap.kisilerListesi;

    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;
  }

  Future<List<Kisiler>> tumKisiler() async {
    var url = Uri.parse("https://fitbodyclub.xyz/deneme/tum_kisiler.php");
    var cevap = await http.get(url);
    return parseKisilerCevap(cevap.body);
  }

  Future<void> kisileriGoster() async {
    var liste = await tumKisiler();

    for (var k = 0; k < 40; k++) {
      print("**************");
      print("Kisi id : ${liste[k].id} ");
      print("Kisi id : ${liste[k].first_name} ");
    }
  }

  @override
  void initState() {
    kisileriGoster();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fitbody",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
