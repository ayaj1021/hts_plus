import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apply_coupon_request.g.dart';

@JsonSerializable(createFactory: false)
class ApplyCouponRequest implements EquatableMixin {
  const ApplyCouponRequest({
    required this.productId,
    required this.quantity,
    required this.couponCode,
  });

  final String productId;
  final String quantity;
  final String couponCode;

  Map<String, dynamic> toJson() => _$ApplyCouponRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object> get props => [productId, quantity, couponCode];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
