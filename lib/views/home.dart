import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_order/viewmodels/cart_view_model.dart';
import 'package:food_order/views/cart_view.dart';
import 'package:food_order/views/categories_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              return const CategoryView();
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0xffFFCA51),
        unselectedItemColor: const Color(0xff9E9E9E),
        currentIndex: 0,
        onTap: (int index) {
          if (index == 1) {
            Navigator.pushNamed(context, CartView.routeName);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CartItemsWidget(),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}

class CartItemsWidget extends StatelessWidget {
  const CartItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);

    return SizedBox(
      height: 30,
      width: 30,
      child: Stack(
        children: [
          const Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 28,
              ),
            ),
          ),
          if (cartViewModel.calculateTotalItems() > 0)
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xff181818),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '${cartViewModel.calculateTotalItems()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
