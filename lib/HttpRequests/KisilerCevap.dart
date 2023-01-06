import 'package:fitbody_flutter/HttpRequests/Kisiler.dart';

class KisilerCevap {
  int success;
  List<Kisiler> kisilerListesi;

  KisilerCevap(this.success, this.kisilerListesi);

  factory KisilerCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["uyelikbilgileri"] as List;
    List<Kisiler> kisilerListesi =
        jsonArray.map((e) => Kisiler.fromJson(e)).toList();
    return KisilerCevap(json["success"] as int, kisilerListesi);
  }
}
