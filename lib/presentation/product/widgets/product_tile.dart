import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jubelio/common/constants/app_images.dart';
import 'package:jubelio/common/constants/app_values.dart';
import 'package:jubelio/common/styles/app_colors.dart';
import 'package:jubelio/common/styles/app_text_styles.dart';
import 'package:jubelio/domain/entities/product.dart';
import 'package:jubelio/domain/entities/product_cache.dart';
import 'package:jubelio/presentation/main/widgets/app_image_network.dart';
import 'package:jubelio/presentation/product/pages/product_detail_page.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(ProductDetailPage.routeName, extra: product.id);
      },
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(
          AppValues.padding,
        ),
        margin: const EdgeInsets.symmetric(horizontal: AppValues.padding),
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: product.images != null && product.images!.isNotEmpty
                  ? AppImageNetwork(
                      product.images![0].src!,
                      height: 74,
                      width: 74,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      AppImages.emptyImage,
                      height: 74,
                      width: 74,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
              width: AppValues.margin,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        product.name ?? "-",
                        style: AppTextStyle.main.copyWith(fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    product.price != null && product.price!.isNotEmpty
                        ? "Rp. ${product.price!}"
                        : "Rp. 0",
                    style: AppTextStyle.brand,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCacheTile extends StatelessWidget {
  final ProductCache product;

  const ProductCacheTile({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed(ProductDetailPage.routeName, extra: product.id);
      },
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(
          AppValues.padding,
        ),
        margin: const EdgeInsets.symmetric(horizontal: AppValues.padding),
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AppImageNetwork(
                product.image,
                height: 74,
                width: 74,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: AppValues.margin,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        product.name,
                        style: AppTextStyle.main.copyWith(fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Rp. ${product.price.isEmpty ? 0 : product.price}",
                    style: AppTextStyle.brand,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
