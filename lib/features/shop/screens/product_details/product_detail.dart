import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            TProductImageSlider(),

            /// 1 - Product Details
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// - Rating & Share Button
                  TRatingAndShare(),

                  /// - Price, Title, Stock, & Brand
                  TProductMetaData(),

                  /// -- Attributes
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Description
                  const TSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is product description for product here in the screen. This is a demo description. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque mattis nulla ante, sed bibendum justo laoreet sed. Etiam nulla enim, consectetur id nulla in, lacinia tempor ipsum.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// -- Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3_copy, size: 18),
                        onPressed: () => Get.to(() => const ProductReviewsScreen()),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
