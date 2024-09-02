// To parse this JSON data, do
//
//     final getAllStoreProductsModel = getAllStoreProductsModelFromJson(jsonString);

import 'dart:convert';

GetAllStoreProductsModel getAllStoreProductsModelFromJson(String str) => GetAllStoreProductsModel.fromJson(json.decode(str));

String getAllStoreProductsModelToJson(GetAllStoreProductsModel data) => json.encode(data.toJson());

class GetAllStoreProductsModel {
    final bool? status;
    final String? message;
    final List<GetAllStoreProductsData>? data;
    final Pagination? pagination;

    GetAllStoreProductsModel({
        this.status,
        this.message,
        this.data,
        this.pagination,
    });

    factory GetAllStoreProductsModel.fromJson(Map<String, dynamic> json) => GetAllStoreProductsModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<GetAllStoreProductsData>.from(json["data"]!.map((x) => GetAllStoreProductsData.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
    };
}

class GetAllStoreProductsData {
    final int? id;
    final String? name;
    final List<String>? cloudinaryUrls;
    final String? description;
    final int? productPrice;
    final double? tax;
    final int? markupPrice;
    final double? discountPrice;
    final bool? inStock;
    final bool? isTaxed;
    final int? quantity;
    final bool? soldIndividually;
    final String? weight;
    final dynamic colour;
    final String? options;
    final String? state;
    final String? tags;
    final bool? isActive;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? partnerStoreId;
    final dynamic averageRating;
    final PartnerStore? partnerStore;
    final List<Category>? categories;

    GetAllStoreProductsData({
        this.id,
        this.name,
        this.cloudinaryUrls,
        this.description,
        this.productPrice,
        this.tax,
        this.markupPrice,
        this.discountPrice,
        this.inStock,
        this.isTaxed,
        this.quantity,
        this.soldIndividually,
        this.weight,
        this.colour,
        this.options,
        this.state,
        this.tags,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.partnerStoreId,
        this.averageRating,
        this.partnerStore,
        this.categories,
    });

    factory GetAllStoreProductsData.fromJson(Map<String, dynamic> json) => GetAllStoreProductsData(
        id: json["id"],
        name: json["name"],
        cloudinaryUrls: json["cloudinaryUrls"] == null ? [] : List<String>.from(json["cloudinaryUrls"]!.map((x) => x)),
        description: json["description"],
        productPrice: json["productPrice"],
        tax: json["tax"]?.toDouble(),
        markupPrice: json["markupPrice"],
        discountPrice: json["discountPrice"]?.toDouble(),
        inStock: json["inStock"],
        isTaxed: json["isTaxed"],
        quantity: json["quantity"],
        soldIndividually: json["soldIndividually"],
        weight: json["weight"],
        colour: json["colour"],
        options: json["options"],
        state: json["state"],
        tags: json["tags"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        partnerStoreId: json["PartnerStoreId"],
        averageRating: json["averageRating"],
        partnerStore: json["partnerStore"] == null ? null : PartnerStore.fromJson(json["partnerStore"]),
        categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cloudinaryUrls": cloudinaryUrls == null ? [] : List<dynamic>.from(cloudinaryUrls!.map((x) => x)),
        "description": description,
        "productPrice": productPrice,
        "tax": tax,
        "markupPrice": markupPrice,
        "discountPrice": discountPrice,
        "inStock": inStock,
        "isTaxed": isTaxed,
        "quantity": quantity,
        "soldIndividually": soldIndividually,
        "weight": weight,
        "colour": colour,
        "options": options,
        "state": state,
        "tags": tags,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "PartnerStoreId": partnerStoreId,
        "averageRating": averageRating,
        "partnerStore": partnerStore?.toJson(),
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    };
}

class Category {
    final int? id;
    final String? name;
    final dynamic description;
    final List<dynamic>? cloudinaryUrls;
    final bool? isVisible;
    final int? parentId;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final ProductCategories? productCategories;
    final int? productCount;

    Category({
        this.id,
        this.name,
        this.description,
        this.cloudinaryUrls,
        this.isVisible,
        this.parentId,
        this.createdAt,
        this.updatedAt,
        this.productCategories,
        this.productCount,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        cloudinaryUrls: json["cloudinaryUrls"] == null ? [] : List<dynamic>.from(json["cloudinaryUrls"]!.map((x) => x)),
        isVisible: json["isVisible"],
        parentId: json["parentId"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        productCategories: json["ProductCategories"] == null ? null : ProductCategories.fromJson(json["ProductCategories"]),
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
        "ProductCategories": productCategories?.toJson(),
        "productCount": productCount,
    };
}

class ProductCategories {
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? categoryId;
    final int? productId;

    ProductCategories({
        this.createdAt,
        this.updatedAt,
        this.categoryId,
        this.productId,
    });

    factory ProductCategories.fromJson(Map<String, dynamic> json) => ProductCategories(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        categoryId: json["CategoryId"],
        productId: json["ProductId"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "CategoryId": categoryId,
        "ProductId": productId,
    };
}

class PartnerStore {
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

    PartnerStore({
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

    factory PartnerStore.fromJson(Map<String, dynamic> json) => PartnerStore(
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

class Pagination {
    final int? totalCount;
    final int? totalPages;
    final int? currentPage;
    final bool? hasNextPage;
    final bool? hasPrevPage;

    Pagination({
        this.totalCount,
        this.totalPages,
        this.currentPage,
        this.hasNextPage,
        this.hasPrevPage,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalCount: json["totalCount"],
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
        hasNextPage: json["hasNextPage"],
        hasPrevPage: json["hasPrevPage"],
    );

    Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "totalPages": totalPages,
        "currentPage": currentPage,
        "hasNextPage": hasNextPage,
        "hasPrevPage": hasPrevPage,
    };
}
