import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/products/model/product.dart';
import 'package:store/products/product_data_repository.dart';

part 'product_details_cubit.freezed.dart';
part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit({required this.productRepository})
      : super(const ProductDetailsState.initial());

  final ProductRepository productRepository;

  Future<void> getProductDetails(int id) async {
    emit(const ProductDetailsLoading());

    final Product product = await productRepository.fetchProductDetails(id);

    emit(ProductDetailsLoaded(product: product));
  }

  Future<void> addToCart(Map<String, dynamic> data, int id) async {
    emit(const ProductDetailsLoading());

    await productRepository.addToCart(data);
    final Product product = await productRepository.fetchProductDetails(id);

    emit(ProductDetailsLoaded(product: product));
  }
}
