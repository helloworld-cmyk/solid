import 'package:get_it/get_it.dart';

import '../data/datasources/product_data_source.dart';
import '../data/datasources/product_data_source_impl.dart';
import '../data/repositories/product_repository_impl.dart';
import '../domain/repositories/product_repository.dart';
import '../domain/usecases/get_product_detail_usecase.dart';
import '../domain/usecases/submit_review_usecase.dart';
import '../presentation/bloc/review_form_bloc.dart';

class ProductInjection {
  const ProductInjection._();

  static void register(GetIt getIt) {
    if (!getIt.isRegistered<ProductDataSource>()) {
      getIt.registerLazySingleton<ProductDataSource>(ProductDataSourceImpl.new);
    }

    if (!getIt.isRegistered<ProductRepository>()) {
      getIt.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(dataSource: getIt<ProductDataSource>()),
      );
    }

    if (!getIt.isRegistered<GetProductDetailUseCase>()) {
      getIt.registerLazySingleton<GetProductDetailUseCase>(
        () => GetProductDetailUseCase(repository: getIt<ProductRepository>()),
      );
    }

    if (!getIt.isRegistered<SubmitReviewUseCase>()) {
      getIt.registerLazySingleton<SubmitReviewUseCase>(
        () => SubmitReviewUseCase(repository: getIt<ProductRepository>()),
      );
    }

    if (!getIt.isRegistered<ReviewFormBloc>()) {
      getIt.registerFactory<ReviewFormBloc>(
        () => ReviewFormBloc(submitReviewUseCase: getIt<SubmitReviewUseCase>()),
      );
    }
  }
}
