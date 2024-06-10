import 'dart:convert';

String comboDataModelListToJson(List<ComboDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

ComboDataModel comboDataModelFromJson(String str, String id) =>
    ComboDataModel.fromJson(json.decode(str), id);

String comboDataModelToJson(ComboDataModel data) => json.encode(data.toJson());

class ComboDataModel {
  String comboId;
  String imageUrl;
  String name;
  String price;
  String description;
  String tag;
  bool favourite;
  int quantity;

  ComboDataModel({
    required this.comboId,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
    required this.tag,
    required this.favourite,
     required this.quantity,
  });

  factory ComboDataModel.fromJson(Map<String, dynamic> json, String id) =>
      ComboDataModel(
        comboId: id,
        imageUrl: json["imageUrl"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        tag: json["tag"],
        favourite: json["favourite"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "comboId": comboId,
        "imageUrl": imageUrl,
        "name": name,
        "price": price,
        "description": description,
        "tag": tag,
        "favourite": favourite,
        "quantity":quantity
      };
}
