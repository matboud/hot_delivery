import 'package:flutter/material.dart';
import 'package:food_order/utils/string/app_stings.dart';
import 'package:food_order/utils/typography/app_typography.dart';
import 'package:food_order/viewmodels/category_view_model.dart';
import 'package:food_order/viewmodels/product_view_model.dart';
import 'package:food_order/views/products_view.dart';
import 'package:food_order/widget/category_tile.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  static const routeName = '/categories';

  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late final categoryViewModel =
      Provider.of<CategoryViewModel>(context, listen: false);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      categoryViewModel.fetchCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryViewModel = Provider.of<CategoryViewModel>(context);
    final productViewModel = Provider.of<ProductViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppString.category,
          style: AppTypography.headline1,
        ),
      ),
      body: categoryViewModel.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            )
          : SafeArea(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                padding: const EdgeInsets.all(8),
                itemCount: categoryViewModel.categories?.length,
                itemBuilder: (context, index) {
                  final category = categoryViewModel.categories?[index];
                  return CategoryTile(
                      category: category,
                      onTap: () {
                        productViewModel.selectedCategoryName =
                            category?.name ?? '';
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const ProductView();
                          },
                        ));
                      });
                },
              ),
            ),
    );
  }
}
