import '../../domain/entities/category_item.dart';

enum CatagoriesStatus { initial, loading, success, failure }

class CatagoriesState {
  const CatagoriesState({
    this.status = CatagoriesStatus.initial,
    this.items = const <CategoryItem>[],
    this.errorMessage,
  });

  final CatagoriesStatus status;
  final List<CategoryItem> items;
  final String? errorMessage;

  bool get isInitial => status == CatagoriesStatus.initial;
  bool get isLoading => status == CatagoriesStatus.loading;
  bool get isFailure => status == CatagoriesStatus.failure;

  CatagoriesState copyWith({
    CatagoriesStatus? status,
    List<CategoryItem>? items,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return CatagoriesState(
      status: status ?? this.status,
      items: items ?? this.items,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }
}
