import 'package:flutter/material.dart';
import 'package:food_order/utils/typography/app_typography.dart';
import 'package:food_order/viewmodels/product_view_model.dart';
import 'package:food_order/widget/product_tile.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  static const routeName = '/product';

  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late final productViewModel =
      Provider.of<ProductViewModel>(context, listen: false);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      productViewModel.fetchProductDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color(0xffFFCA51),
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: Text(
                productViewModel.selectedCategoryName ?? "",
                style: AppTypography.headline3.copyWith(color: Colors.white),
              ),
              background: Image.network(
                'https://images.squarespace-cdn.com/content/v1/56c5e7998259b50586cb700e/5fcdbd7b-74f0-4935-b99c-1ac38988d432/Little+Beet+Table+Catering+2022',
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (productViewModel.isLoading)
            const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ),
            )
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ProductTile(
                    product: productViewModel.productDetails[index],
                  );
                },
                childCount: productViewModel.productDetails
                    .length,
              ),
            ),
        ],
      ),
    );
  }
}
