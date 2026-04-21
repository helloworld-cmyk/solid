import '../../domain/entities/coupon.dart';

class CouponModel {
  const CouponModel({
    required this.code,
    required this.type,
    required this.value,
    required this.description,
    required this.minimumOrderAmount,
  });

  final String code;
  final CouponType type;
  final double value;
  final String description;
  final double minimumOrderAmount;

  Coupon toEntity() {
    return Coupon(
      code: code,
      type: type,
      value: value,
      description: description,
      minimumOrderAmount: minimumOrderAmount,
    );
  }
}
