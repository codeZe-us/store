import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/connectivity/cubit/internet_cubit.dart';
import 'package:store/products/cubit/product_cubit.dart';
import 'package:store/products/view/product/product_shimmer.dart';
import 'package:store/products/view/product/products_list_view.dart';
import 'package:store/shared/theme.dart';

import '../../../constant/dimensions.dart';
import '../../../home/view/promotion_banner.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected) {
          context.read<ProductCubit>().fetchProducts();
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
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/menu.png',
                        width: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      icon: const Icon(Icons.shopping_cart),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Promotions(),
                  const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    'DISCOVER',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: BlocBuilder<ProductCubit, ProductState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () {
                            return const ProductShimmer();
                          },
                          loaded: (productsList) =>
                              ProductsListView(productsList: productsList),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
