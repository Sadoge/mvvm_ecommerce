import 'package:get_it/get_it.dart';
import 'package:mvvm_ecommerce/src/features/ecommerce/data/datasources/product_local_data_source.dart';
import 'package:mvvm_ecommerce/src/features/ecommerce/data/repositories/product_repository_impl.dart';
import 'features/ecommerce/domain/repositories/product_repository.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Data sources
  getIt.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl());

  // Repositories
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getIt<ProductLocalDataSource>()));
}
