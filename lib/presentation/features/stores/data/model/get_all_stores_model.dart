// To parse this JSON data, do
//
//     final getAllStoresModel = getAllStoresModelFromJson(jsonString);

import 'dart:convert';

GetAllStoresModel getAllStoresModelFromJson(String str) => GetAllStoresModel.fromJson(json.decode(str));

String getAllStoresModelToJson(GetAllStoresModel data) => json.encode(data.toJson());

class GetAllStoresModel {
    final bool? status;
    final String? message;
    final List<GetAllStoresData>? data;

    GetAllStoresModel({
        this.status,
        this.data,
        this.message,
    });

    factory GetAllStoresModel.fromJson(Map<String, dynamic> json) => GetAllStoresModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<GetAllStoresData>.from(json["data"]!.map((x) => GetAllStoresData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class GetAllStoresData {
    final int? id;
    final String? name;
    final String? email;
    final dynamic contact;
    final dynamic location;
    final List<String>? cloudinaryUrls;
    final dynamic sales;
    final dynamic products;
    final bool? isVisible;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    GetAllStoresData({
        this.id,
        this.name,
        this.email,
        this.contact,
        this.location,
        this.cloudinaryUrls,
        this.sales,
        this.products,
        this.isVisible,
        this.createdAt,
        this.updatedAt,
    });

    factory GetAllStoresData.fromJson(Map<String, dynamic> json) => GetAllStoresData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        contact: json["contact"],
        location: json["location"],
        cloudinaryUrls: json["cloudinaryUrls"] == null ? [] : List<String>.from(json["cloudinaryUrls"]!.map((x) => x)),
        sales: json["sales"],
        products: json["products"],
        isVisible: json["isVisible"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "contact": contact,
        "location": location,
        "cloudinaryUrls": cloudinaryUrls == null ? [] : List<dynamic>.from(cloudinaryUrls!.map((x) => x)),
        "sales": sales,
        "products": products,
        "isVisible": isVisible,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
