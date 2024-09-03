// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CheckOutRequestToJson(CheckOutRequest instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'reference': instance.reference,
      'orderNote': instance.orderNote,
      'orderType': instance.orderType,
      'paymentType': instance.paymentType,
      'isNewCustomer': instance.isNewCustomer,
      'orderItems': instance.orderItems,
      'couponCode': instance.couponCode,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      productId: (json['productId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
    };
