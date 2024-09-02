// To parse this JSON data, do
//
//     final getCartTotalModel = getCartTotalModelFromJson(jsonString);

import 'dart:convert';

GetCartTotalModel getCartTotalModelFromJson(String str) => GetCartTotalModel.fromJson(json.decode(str));

String getCartTotalModelToJson(GetCartTotalModel data) => json.encode(data.toJson());

class GetCartTotalModel <T>{
    final bool? status;
    final GetCartTotalData? data;

    GetCartTotalModel({
        this.status,
        this.data,
    });

    factory GetCartTotalModel.fromJson(Map<String, dynamic> json) => GetCartTotalModel(
        status: json["status"],
        data: json["data"] == null ? null : GetCartTotalData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class GetCartTotalData {
    final num? totalAmount;
    final String? discountType;
    final num? discountAmount;
    final num? shippingFee;
    final num? subTotal;

    GetCartTotalData({
        this.totalAmount,
        this.discountType,
        this.discountAmount,
        this.shippingFee,
        this.subTotal,
    });

    factory GetCartTotalData.fromJson(Map<String, dynamic> json) => GetCartTotalData(
        totalAmount: json["totalAmount"],
        discountType: json["discountType"],
        discountAmount: json["discountAmount"],
        shippingFee: json["shippingFee"],
        subTotal: json["subTotal"],
    );

    Map<String, dynamic> toJson() => {
        "totalAmount": totalAmount,
        "discountType": discountType,
        "discountAmount": discountAmount,
        "shippingFee": shippingFee,
        "subTotal": subTotal,
    };
}
