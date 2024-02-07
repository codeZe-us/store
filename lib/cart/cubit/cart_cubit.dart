import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/cart/cart_repository.dart';
import 'package:store/products/model/product.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepository}) : super(const CartState.initial());

  final CartRepository cartRepository;

  Future<void> fetchCartItems() async {
    emit(const CartLoading());

    final List<Product> productsList = await cartRepository.fetchProducts();
    emit(CartLoaded(productList: productsList));
  }
}
