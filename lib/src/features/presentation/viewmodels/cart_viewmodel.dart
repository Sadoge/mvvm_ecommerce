import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_ecommerce/src/features/ecommerce/domain/entities/product.dart';

final cartProvider = StateNotifierProvider<CartViewModel, List<Product>>(
    (ref) => CartViewModel());

class CartViewModel extends StateNotifier<List<Product>> {
  CartViewModel() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct(Product product) {
    state = state.where((p) => p.id != product.id).toList();
  }
}
