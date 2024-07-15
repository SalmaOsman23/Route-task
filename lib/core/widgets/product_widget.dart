
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:route_task/utils/app_colors.dart';


class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.desPrice,
    required this.rate,
  });

  final String image;
  final String name;
  final String description;
  final String price;
  final String desPrice;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightBlue,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [

            // Image And Heart Icon
            Stack(
              children: [
                // Image And Error Image
                Padding(
                  padding:  const EdgeInsets.all(1.0),
                  child: image.isNotEmpty ? Image.network(
                    image,
                    fit: BoxFit.cover,
                    height: 80,
                    width: double.infinity,
                  ) : const Icon(
                    Icons.error,
                    size: 25,
                  ),
                ),

                // Heart Icon
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          IconlyLight.heart,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Name Product
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  // Desc Product
                  Text(
                    description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Price
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'EGP: $price',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                              color: AppColors.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          '$desPrice EGP',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                            color: AppColors.lightBlue,
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Rating
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'Review ($rate)',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          IconlyBold.star,
                          size: 20,
                          color: AppColors.yellow,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child:   const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.add,
                                color: AppColors.white,
                               size: 19,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}