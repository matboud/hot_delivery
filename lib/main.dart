import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_order/utils/string/app_stings.dart';
import 'package:food_order/viewmodels/cart_view_model.dart';
import 'package:food_order/viewmodels/category_view_model.dart';
import 'package:food_order/viewmodels/product_view_model.dart';
import 'package:food_order/views/cart_view.dart';
import 'package:food_order/views/categories_view.dart';
import 'package:food_order/views/home.dart';
import 'package:food_order/views/products_view.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: "assets/env/.env");
  runApp(MultiProvider(providers: [
    categoryViewModelProvider,
    ChangeNotifierProvider<ProductViewModel>(create: (_) => ProductViewModel()),
    ChangeNotifierProvider<CartViewModel>(
      create: (context) =>
          CartViewModel(Provider.of<ProductViewModel>(context, listen: false)),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (settings) {
        if (settings.name == HomeScreen.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          );
        }
        if (settings.name == ProductView.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              return const ProductView();
            },
          );
        }
        if (settings.name == CartView.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              return const CartView();
            },
          );
        }
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      },
      routes: {
        CartView.routeName: (context) => const CartView(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        ProductView.routeName: (context) => const ProductView(),
        CategoryView.routeName: (context) => const CategoryView(),
      },
    );
  }
}
