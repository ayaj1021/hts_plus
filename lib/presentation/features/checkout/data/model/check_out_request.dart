import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_out_request.g.dart';

@JsonSerializable(createFactory: false)
class CheckOutRequest implements EquatableMixin {
  const CheckOutRequest({
    required this.customerId,
    required this.reference,
    required this.orderNote,
    required this.orderType,
    required this.paymentType,
    required this.isNewCustomer,
    required this.orderItems,
    required this.couponCode,
  });

  final int customerId;
  final String reference;
  final String orderNote;
  final String orderType;
  final String paymentType;
  final bool isNewCustomer;
  final List<OrderItem> orderItems;
  final String couponCode;

  Map<String, dynamic> toJson() => _$CheckOutRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object> get props => [
        customerId,
        reference,
        orderNote,
        orderType,
        paymentType,
        isNewCustomer,
        orderItems,
        couponCode,
      ];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}

@JsonSerializable()
class OrderItem extends Equatable {
  const OrderItem({
    required this.productId,
    required this.quantity,
  });

  final int productId;
  final int quantity;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);

  @override
  List<Object> get props => [productId, quantity];
}
