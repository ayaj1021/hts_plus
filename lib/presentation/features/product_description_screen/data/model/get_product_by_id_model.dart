// To parse this JSON data, do
//
//     final getProductsByIdModel = getProductsByIdModelFromJson(jsonString);

import 'dart:convert';

GetProductsByIdModel getProductsByIdModelFromJson(String str) => GetProductsByIdModel.fromJson(json.decode(str));

String getProductsByIdModelToJson(GetProductsByIdModel data) => json.encode(data.toJson());

class GetProductsByIdModel {
    final bool? status;
    final String? message;
    final GetProductByIdData? data;

    GetProductsByIdModel({
        this.status,
        this.message,
        this.data,
    });

    factory GetProductsByIdModel.fromJson(Map<String, dynamic> json) => GetProductsByIdModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : GetProductByIdData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class GetProductByIdData {
    final int? id;
    final String? name;
    final List<String>? cloudinaryUrls;
    final String? description;
    final int? productPrice;
    final double? tax;
    final int? markupPrice;
    final int? discountPrice;
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
    final List<Category>? categories;
    final PartnerStore? partnerStore;
    final List<NumberCard>? numberCards;

    GetProductByIdData({
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
        this.categories,
        this.partnerStore,
        this.numberCards,
    });

    factory GetProductByIdData.fromJson(Map<String, dynamic> json) => GetProductByIdData(
        id: json["id"],
        name: json["name"],
        cloudinaryUrls: json["cloudinaryUrls"] == null ? [] : List<String>.from(json["cloudinaryUrls"]!.map((x) => x)),
        description: json["description"],
        productPrice: json["productPrice"],
        tax: json["tax"]?.toDouble(),
        markupPrice: json["markupPrice"],
        discountPrice: json["discountPrice"],
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
        categories: json["Categories"] == null ? [] : List<Category>.from(json["Categories"]!.map((x) => Category.fromJson(x))),
        partnerStore: json["partnerStore"] == null ? null : PartnerStore.fromJson(json["partnerStore"]),
        numberCards: json["numberCards"] == null ? [] : List<NumberCard>.from(json["numberCards"]!.map((x) => NumberCard.fromJson(x))),
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
        "Categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "partnerStore": partnerStore?.toJson(),
        "numberCards": numberCards == null ? [] : List<dynamic>.from(numberCards!.map((x) => x.toJson())),
    };
}

class Category {
    final int? id;
    final String? name;
    final int? parentId;
    final ProductCategories? productCategories;

    Category({
        this.id,
        this.name,
        this.parentId,
        this.productCategories,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        parentId: json["parentId"],
        productCategories: json["ProductCategories"] == null ? null : ProductCategories.fromJson(json["ProductCategories"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parentId": parentId,
        "ProductCategories": productCategories?.toJson(),
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

class NumberCard {
    final String? label;
    final int? value;
    final int? percentage;
    final String? type;

    NumberCard({
        this.label,
        this.value,
        this.percentage,
        this.type,
    });

    factory NumberCard.fromJson(Map<String, dynamic> json) => NumberCard(
        label: json["label"],
        value: json["value"],
        percentage: json["percentage"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
        "percentage": percentage,
        "type": type,
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
