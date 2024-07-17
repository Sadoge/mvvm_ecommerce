import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_ecommerce/src/features/ecommerce/domain/entities/product.dart';
import 'package:mvvm_ecommerce/src/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:mvvm_ecommerce/src/injection_container.dart';

final productViewModelProvider =
    StateNotifierProvider<ProductViewModel, AsyncValue<List<Product>>>((ref) {
  final repo = getIt.get<ProductRepository>();
  return ProductViewModel(repo);
});

class ProductViewModel extends StateNotifier<AsyncValue<List<Product>>> {
  final ProductRepository productRepository;

  ProductViewModel(this.productRepository) : super(const AsyncValue.loading()) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final products = await productRepository.getProducts();
      state = AsyncValue.data(products);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
