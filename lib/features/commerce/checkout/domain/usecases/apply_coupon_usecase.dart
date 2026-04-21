import '../entities/coupon.dart';
import '../repositories/checkout_repository.dart';

class ApplyCouponUseCase {
  const ApplyCouponUseCase({required CheckoutRepository repository})
    : _repository = repository;

  final CheckoutRepository _repository;

  Future<ApplyCouponResult> call(ApplyCouponParams params) async {
    final String normalizedCode = params.code.trim().toUpperCase();
    if (normalizedCode.isEmpty) {
      return const ApplyCouponResult.failure('Please enter coupon code.');
    }

    final Coupon? coupon = await _repository.findCouponByCode(normalizedCode);
    if (coupon == null) {
      return const ApplyCouponResult.failure('Coupon code is invalid.');
    }

    final double discount = coupon.discountFor(params.subTotal);
    if (discount <= 0) {
      return const ApplyCouponResult.failure(
        'Coupon is not applicable for this order.',
      );
    }

    return ApplyCouponResult.success(coupon);
  }
}

class ApplyCouponParams {
  const ApplyCouponParams({required this.code, required this.subTotal});

  final String code;
  final double subTotal;
}

class ApplyCouponResult {
  const ApplyCouponResult.success(this.coupon)
    : message = null,
      isSuccess = true;

  const ApplyCouponResult.failure(this.message)
    : coupon = null,
      isSuccess = false;

  final Coupon? coupon;
  final String? message;
  final bool isSuccess;
}
