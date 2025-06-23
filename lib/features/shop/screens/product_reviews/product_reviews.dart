import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// --- Appbar
      appBar: TAppBar(
        title: Text(
          'Reviews & Ratings',
          style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.black),
        ),
        showBackArrow: true,
      ),

      /// --- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ratings & reviews are verified and are from people who use the same type of device that you use"),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Overall Product Ratings
              TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5),
              Text('12,612', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
