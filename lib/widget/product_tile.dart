import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_order/models/data.dart';
import 'package:food_order/models/meta_fields.dart';
import 'package:food_order/utils/string/app_stings.dart';
import 'package:food_order/utils/typography/app_typography.dart';
import 'package:food_order/widget/add_to_cart_widget.dart';
import 'package:food_order/widget/calories_progress_bar.dart';
import 'package:food_order/widget/nutrition_info_widget.dart';

class ProductTile extends StatelessWidget {
  final Data product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? '',
                    style: AppTypography.headline4,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NutritionInfo(
                        tile: AppString.calories,
                        value: product.metaFields
                                ?.firstWhere(
                                    (element) => element.key == 'calories',
                                    orElse: () => MetaFields(value: "-"))
                                .value
                                .toString() ??
                            '-',
                      ),
                      NutritionInfo(
                        tile: AppString.protein,
                        value: product.metaFields
                                ?.firstWhere(
                                    (element) => element.key == "protein",
                                    orElse: () => MetaFields(value: "-"))
                                .value
                                .toString() ??
                            '-',
                      ),
                      NutritionInfo(
                        tile: AppString.fiber,
                        value: product.metaFields
                                ?.firstWhere(
                                    (element) => element.key == "fib",
                                    orElse: () => MetaFields(value: "-"))
                                .value
                                .toString() ??
                            '-',
                      ),
                      CaloriesProgressBar(
                        consumedCalories: product.metaFields
                            ?.firstWhere((element) => element.key == "calories",
                                orElse: () => MetaFields(value: 0))
                            .value,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      AddToCartWidget(
                        productId: product.id.toString(),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        product.variants?[0].price?.formatted ?? '',
                        style: AppTypography.bodyText1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          SizedBox(
            width: 80,
            height: 80,
            child: CachedNetworkImage(
              imageUrl: product.media?[0].url ?? '',
              fit: BoxFit.cover,
              placeholder: (context, url) => const Padding(
                padding:  EdgeInsets.all(20.0),
                child:  CircularProgressIndicator(color: Colors.amber,),
              ),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          )
        ],
      ),
    );
  }
}
