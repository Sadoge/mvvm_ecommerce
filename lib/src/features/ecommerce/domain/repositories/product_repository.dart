import 'package:mvvm_ecommerce/src/features/ecommerce/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
