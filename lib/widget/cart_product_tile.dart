import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_order/models/data.dart';
import 'package:food_order/utils/typography/app_typography.dart';

class CartProductTile extends StatelessWidget {
  final Data product;
  final int quantity;
  final void Function()? onRemove;

  const CartProductTile(
      {super.key,
      required this.product,
      required this.quantity,
      this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: product.media![0].url!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text.rich(
            TextSpan(
              text: "$quantity",
              children: [
                TextSpan(
                  text: " x",
                  style: AppTypography.caption,
                ),
              ],
            ),
            style: AppTypography.bodyText1,
          ),
          const SizedBox(width: 16),
          Text(
            product.title!,
            maxLines: 2,
            style: AppTypography.bodyText1.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            "${product.variants![0].price?.formatted!}",
            style: AppTypography.captionBold,
          ),
          IconButton(onPressed: onRemove, icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}
