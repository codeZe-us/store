import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/connectivity/cubit/internet_cubit.dart';
import 'package:store/products/cubit/product_details_cubit.dart';
import 'package:store/products/model/product.dart';
import 'package:store/products/view/product_detail/product_detail_view.dart';
import 'package:store/products/view/product_detail/product_details_shimmer.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Internet Connected',
              ),
            ),
          );
        } else if (state is InternetDisconnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Internet Disconnected',
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
            child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            return state.when(
              initial: () {
                context
                    .read<ProductDetailsCubit>()
                    .getProductDetails(product.id!);
                return const ProductDetailsShimmer();
              },
              loading: () {
                return const ProductDetailsShimmer();
              },
              loaded: (productDetails) {
                return ProductDetailView(
                  product: productDetails,
                );
              },
            );
          },
        )),
      ),
    );
  }
}
