// To parse this JSON data, do
//
//     final wishListModel = wishListModelFromJson(jsonString);

import 'dart:convert';

WishListModel wishListModelFromJson(String str) => WishListModel.fromJson(json.decode(str));

String wishListModelToJson(WishListModel data) => json.encode(data.toJson());

class WishListModel {
    final bool? status;
    final String? message;
    final List<WishListModelData>? data;

    WishListModel({
        this.status,
        this.message,
        this.data,
    });

    factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<WishListModelData>.from(json["data"]!.map((x) => WishListModelData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class WishListModelData {
    final int? id;
    final int? userId;
    final int? productId;
    final int? quantity;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Product? product;

    WishListModelData({
        this.id,
        this.userId,
        this.productId,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.product,
    });

    factory WishListModelData.fromJson(Map<String, dynamic> json) => WishListModelData(
        id: json["id"],
        userId: json["userId"],
        productId: json["productId"],
        quantity: json["quantity"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        product: json["Product"] == null ? null : Product.fromJson(json["Product"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "productId": productId,
        "quantity": quantity,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "Product": product?.toJson(),
    };
}

class Product {
    final int? id;
    final String? name;
    final int? markupPrice;
    final dynamic discountPrice;
    final String? description;
    final List<String>? cloudinaryUrls;

    Product({
        this.id,
        this.name,
        this.markupPrice,
        this.discountPrice,
        this.description,
        this.cloudinaryUrls,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        markupPrice: json["markupPrice"],
        discountPrice: json["discountPrice"],
        description: json["description"],
        cloudinaryUrls: json["cloudinaryUrls"] == null ? [] : List<String>.from(json["cloudinaryUrls"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "markupPrice": markupPrice,
        "discountPrice": discountPrice,
        "description": description,
        "cloudinaryUrls": cloudinaryUrls == null ? [] : List<dynamic>.from(cloudinaryUrls!.map((x) => x)),
    };
}
