import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_out_request.g.dart';

@JsonSerializable(createFactory: false)
class CheckOutRequest implements EquatableMixin {
  const CheckOutRequest({
    required this.productId,
   
    required this.reference,
    required this.orderNote,
    required this.orderType,
    required this.paymentType,
    required this.isNewCustomer,
    required this.quantity,
    required this.couponCode,
  });

  final String productId;
 
  final String reference;
  final String orderNote;
  final String orderType;
  final String quantity;
  final String paymentType;
  final bool isNewCustomer;
  final String couponCode;

  Map<String, dynamic> toJson() => _$CheckOutRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object> get props => [
        productId,
        quantity,
        couponCode,
       
        reference,
        orderNote,
        orderType,
        paymentType,
        isNewCustomer
      ];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
