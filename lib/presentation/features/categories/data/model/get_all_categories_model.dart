// To parse this JSON data, do
//
//     final getAllCategoriesModel = getAllCategoriesModelFromJson(jsonString);

import 'dart:convert';

GetAllCategoriesModel getAllCategoriesModelFromJson(String str) => GetAllCategoriesModel.fromJson(json.decode(str));

String getAllCategoriesModelToJson(GetAllCategoriesModel data) => json.encode(data.toJson());

class GetAllCategoriesModel {
    final bool? status;
    final String? message;
    final List<GetAllCategoriesData>? data;
    final Pagination? pagination;

    GetAllCategoriesModel({
        this.status,
        this.message,
        this.data,
        this.pagination,
    });

    factory GetAllCategoriesModel.fromJson(Map<String, dynamic> json) => GetAllCategoriesModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<GetAllCategoriesData>.from(json["data"]!.map((x) => GetAllCategoriesData.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
    };
}

class GetAllCategoriesData {
    final int? id;
    final String? name;
    final dynamic description;
    final List<String>? cloudinaryUrls;
    final bool? isVisible;
    final int? parentId;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Parent? parent;
    final List<Child>? children;
    final int? productCount;

    GetAllCategoriesData({
        this.id,
        this.name,
        this.description,
        this.cloudinaryUrls,
        this.isVisible,
        this.parentId,
        this.createdAt,
        this.updatedAt,
        this.parent,
        this.children,
        this.productCount,
    });

    factory GetAllCategoriesData.fromJson(Map<String, dynamic> json) => GetAllCategoriesData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        cloudinaryUrls: json["cloudinaryUrls"] == null ? [] : List<String>.from(json["cloudinaryUrls"]!.map((x) => x)),
        isVisible: json["isVisible"],
        parentId: json["parentId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
        children: json["children"] == null ? [] : List<Child>.from(json["children"]!.map((x) => Child.fromJson(x))),
        productCount: json["productCount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "cloudinaryUrls": cloudinaryUrls == null ? [] : List<dynamic>.from(cloudinaryUrls!.map((x) => x)),
        "isVisible": isVisible,
        "parentId": parentId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "parent": parent?.toJson(),
        "children": children == null ? [] : List<dynamic>.from(children!.map((x) => x.toJson())),
        "productCount": productCount,
    };
}

class Child {
    final String? name;
    final int? id;

    Child({
        this.name,
        this.id,
    });

    factory Child.fromJson(Map<String, dynamic> json) => Child(
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}

class Parent {
    final String? name;

    Parent({
        this.name,
    });

    factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class Pagination {
    final int? totalPages;
    final int? currentPage;
    final int? totalCount;
    final bool? hasNextPage;
    final bool? hasPrevPage;

    Pagination({
        this.totalPages,
        this.currentPage,
        this.totalCount,
        this.hasNextPage,
        this.hasPrevPage,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
        totalCount: json["totalCount"],
        hasNextPage: json["hasNextPage"],
        hasPrevPage: json["hasPrevPage"],
    );

    Map<String, dynamic> toJson() => {
        "totalPages": totalPages,
        "currentPage": currentPage,
        "totalCount": totalCount,
        "hasNextPage": hasNextPage,
        "hasPrevPage": hasPrevPage,
    };
}
