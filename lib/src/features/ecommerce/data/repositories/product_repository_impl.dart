import 'package:mvvm_ecommerce/src/features/ecommerce/data/datasources/product_local_data_source.dart';
import 'package:mvvm_ecommerce/src/features/ecommerce/domain/entities/product.dart';
import 'package:mvvm_ecommerce/src/features/ecommerce/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl(this.localDataSource);

  @override
  Future<List<Product>> getProducts() async {
    return await localDataSource.getProducts();
  }
}
