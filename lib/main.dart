import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cart/cart_repository.dart';
import 'package:store/cart/cubit/cart_cubit.dart';
import 'package:store/cart/views/cart.dart';
import 'package:store/connectivity/cubit/internet_cubit.dart';
import 'package:store/home/view/home.dart';
import 'package:store/products/cubit/product_cubit.dart';
import 'package:store/products/product_data_repository.dart';
import 'package:store/shared/theme.dart';

void main() {
  runApp(
    MyApp(
      connectivity: Connectivity(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.connectivity}) : super(key: key);

  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(connectivity: connectivity),
      child: MaterialApp(
        title: 'Future Store',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(context),
        darkTheme: AppTheme.light(context),
        // Set the initialRoute to '/login' for the LoginScreen
        initialRoute: '/home',
        routes: {
          // '/login': (context) => LoginScreen(), 
          '/home': (context) => BlocProvider(
            create: (context) =>
                ProductCubit(productRepository: const ProductRepository()),
            child: const Home(),
          ),
          '/cart': (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    CartCubit(cartRepository: const CartRepository()),
              ),
              BlocProvider(
                create: (context) => ProductCubit(
                    productRepository: const ProductRepository()),
              ),
            ],
            child: const Cart(),
          ),
        },
      ),
    );
  }
}
