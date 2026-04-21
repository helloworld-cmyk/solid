import '../repositories/checkout_repository.dart';

class PlaceOrderUseCase {
  const PlaceOrderUseCase({required CheckoutRepository repository})
    : _repository = repository;

  final CheckoutRepository _repository;

  Future<PlaceOrderResult> call(PlaceOrderParams params) async {
    if (params.subTotal <= 0) {
      return const PlaceOrderResult.failure('Your cart is empty.');
    }

    final double totalAmount = params.subTotal.clamp(
      0,
      double.infinity,
    );

    if (totalAmount <= 0) {
      return const PlaceOrderResult.failure('Order total is invalid.');
    }

    await _repository.placeOrder(totalAmount: totalAmount);
    return const PlaceOrderResult.success();
  }
}

class PlaceOrderParams {
  const PlaceOrderParams({required this.subTotal});

  final double subTotal;
}

class PlaceOrderResult {
  const PlaceOrderResult.success() : isSuccess = true, message = null;

  const PlaceOrderResult.failure(this.message) : isSuccess = false;

  final bool isSuccess;
  final String? message;
}
