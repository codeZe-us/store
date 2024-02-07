// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<CartModel> CartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String CartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  CartModel({
    this.id,
    this.userId,
    this.date,
    this.products,
    this.v,
  });

  int? id;
  int? userId;
  DateTime? date;
  List<CartProduct>? products;
  int? v;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<CartProduct>.from(
            json["products"].map((x) => CartProduct.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date?.toIso8601String(),
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "__v": v,
      };
}

class CartProduct {
  CartProduct({
    this.productId,
    this.quantity,
  });

  int? productId;
  int? quantity;

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
