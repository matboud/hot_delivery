import 'package:flutter/material.dart';
import 'package:food_order/models/category.dart';
import 'package:food_order/utils/extensions/string_extension.dart';
import 'package:food_order/utils/typography/app_typography.dart';

class CategoryTile extends StatelessWidget {
  final Category? category;
  final void Function()? onTap;
  const CategoryTile({super.key, required this.category,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    category?.name?.getIconPath() ?? ''.getIconPath(),
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              category?.name ?? '',
              style: AppTypography.bodyText1,
            ),
          ],
        )),
    );
  }
}
