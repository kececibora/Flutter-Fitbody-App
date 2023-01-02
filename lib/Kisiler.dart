class Kisiler {
  String id;
  String first_name;
  String email;

  Kisiler(this.id, this.first_name, this.email);

  factory Kisiler.fromJson(Map<String, dynamic> json) {
    return Kisiler(
      json["id"] as String,
      json["first_name"] as String,
      json["email"] as String,
    );
  }
}
