// To parse this JSON data, do
//
//     final getCartModel = getCartModelFromJson(jsonString);

import 'dart:convert';

GetCartModel getCartModelFromJson(String str) => GetCartModel.fromJson(json.decode(str));

String getCartModelToJson(GetCartModel data) => json.encode(data.toJson());

class GetCartModel {
    final bool? status;
    final String? message;
    final List<GetCartData>? data;

    GetCartModel({
        this.status,
        this.message,
        this.data,
    });

    factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<GetCartData>.from(json["data"]!.map((x) => GetCartData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class GetCartData {
    final int? id;
    final int? userId;
    final int? productId;
    final int? quantity;
    final int? price;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Product? product;

    GetCartData({
        this.id,
        this.userId,
        this.productId,
        this.quantity,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.product,
    });

    factory GetCartData.fromJson(Map<String, dynamic> json) => GetCartData(
        id: json["id"],
        userId: json["userId"],
        productId: json["productId"],
        quantity: json["quantity"],
        price: json["price"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        product: json["Product"] == null ? null : Product.fromJson(json["Product"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "productId": productId,
        "quantity": quantity,
        "price": price,
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
    final PartnerStore? partnerStore;

    Product({
        this.id,
        this.name,
        this.markupPrice,
        this.discountPrice,
        this.description,
        this.cloudinaryUrls,
        this.partnerStore,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        markupPrice: json["markupPrice"],
        discountPrice: json["discountPrice"],
        description: json["description"],
        cloudinaryUrls: json["cloudinaryUrls"] == null ? [] : List<String>.from(json["cloudinaryUrls"]!.map((x) => x)),
        partnerStore: json["PartnerStore"] == null ? null : PartnerStore.fromJson(json["PartnerStore"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "markupPrice": markupPrice,
        "discountPrice": discountPrice,
        "description": description,
        "cloudinaryUrls": cloudinaryUrls == null ? [] : List<dynamic>.from(cloudinaryUrls!.map((x) => x)),
        "PartnerStore": partnerStore?.toJson(),
    };
}

class PartnerStore {
    final int? id;
    final String? name;
    final List<String>? cloudinaryUrls;

    PartnerStore({
        this.id,
        this.name,
        this.cloudinaryUrls,
    });

    factory PartnerStore.fromJson(Map<String, dynamic> json) => PartnerStore(
        id: json["id"],
        name: json["name"],
        cloudinaryUrls: json["cloudinaryUrls"] == null ? [] : List<String>.from(json["cloudinaryUrls"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cloudinaryUrls": cloudinaryUrls == null ? [] : List<dynamic>.from(cloudinaryUrls!.map((x) => x)),
    };
}
