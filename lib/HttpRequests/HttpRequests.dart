import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Kisiler.dart';
import 'KisilerCevap.dart';

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

Future<List<Kisiler>> kisilerAra(String aramaKelimesi) async {
  var url = Uri.parse("https://fitbodyclub.xyz/deneme/tum_kisiler_arama.php");
  var veri = {"first_name": aramaKelimesi};
  var cevap = await http.post(url, body: veri);
  return parseKisilerCevap(cevap.body);
}

Future<void> kisiSil(int id) async {
  var url = Uri.parse("https://fitbodyclub.xyz/deneme/delete_kisiler.php");
  var veri = {"id": id.toString()};
  var cevap = await http.post(url, body: veri);
  print("Silme Cevap ${cevap.body} ");
}

Future<void> kisiEkle(String first_name, String email) async {
  var url = Uri.parse("https://fitbodyclub.xyz/deneme/insert_kisiler.php");
  var veri = {"first_name": first_name, "email": email};
  var cevap = await http.post(url, body: veri);
  print("Ekle Cevap ${cevap.body} ");
}

Future<void> kisiGuncelle(int id, String first_name, String email) async {
  var url = Uri.parse("https://fitbodyclub.xyz/deneme/update_kisiler.php");
  var veri = {"id": id.toString(), "first_name": first_name, "email": email};
  var cevap = await http.post(url, body: veri);
  print("Değiştirildi mi? ${cevap.body} ");
}

Future<void> kisileriGoster(String yaz) async {
  var liste = await kisilerAra(yaz);

  for (var k = 0; k < liste.length; k++) {
    print("**************");
    print("Kisi id : ${liste[k].id} ");
    print("Kisi id : ${liste[k].first_name} ");
  }
}
