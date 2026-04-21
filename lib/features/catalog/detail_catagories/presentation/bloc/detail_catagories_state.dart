import '../../domain/entities/detail_catagories_product.dart';

enum DetailCatagoriesStatus { initial, loading, success, failure }

class DetailCatagoriesState {
  const DetailCatagoriesState({
    this.status = DetailCatagoriesStatus.initial,
    this.categories = const <String>[],
    this.products = const <DetailCatagoriesProduct>[],
    this.selectedCategory = 'All Product',
    this.heroImagePath = 'assets/catagories/men.png',
    this.isCategorySheetOpen = false,
    this.errorMessage,
  });

  final DetailCatagoriesStatus status;
  final List<String> categories;
  final List<DetailCatagoriesProduct> products;
  final String selectedCategory;
  final String heroImagePath;
  final bool isCategorySheetOpen;
  final String? errorMessage;

  bool get isInitial => status == DetailCatagoriesStatus.initial;
  bool get isLoading => status == DetailCatagoriesStatus.loading;
  bool get isSuccess => status == DetailCatagoriesStatus.success;
  bool get isFailure => status == DetailCatagoriesStatus.failure;

  DetailCatagoriesState copyWith({
    DetailCatagoriesStatus? status,
    List<String>? categories,
    List<DetailCatagoriesProduct>? products,
    String? selectedCategory,
    String? heroImagePath,
    bool? isCategorySheetOpen,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return DetailCatagoriesState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      heroImagePath: heroImagePath ?? this.heroImagePath,
      isCategorySheetOpen: isCategorySheetOpen ?? this.isCategorySheetOpen,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }
}
