import 'dart:convert';

class ProdukModel {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  ProdukModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory ProdukModel.fromRawJson(String str) =>
      ProdukModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProdukModel.fromJson(Map<String, dynamic> json) =>
      ProdukModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
