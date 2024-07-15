import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/core/home_screen/presentation/bloc/home_cubit.dart';
import 'package:route_task/core/widgets/product_widget.dart';
import 'package:route_task/core/widgets/search_and_cart_widget.dart';
import 'package:route_task/utils/app_assets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocProvider(
          create: (context) => HomeCubit()..getProducts(),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = BlocProvider.of<HomeCubit>(context);
              return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),

                        // Logo App
                        Image.asset(
                          AppAssets.logo,
                          width: 70,
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        // Search Product And Add Product To Cart
                        SearchAndCartComponent(
                          cubit: cubit,
                        ),

                        // Products View
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio: 0.8),
                            itemCount: cubit.search?.length,
                            itemBuilder: (context, index) {
                              return ProductWidget(
                                image: cubit.search?[index].images[0]
                                    .toString() ?? "",
                                name: cubit.search?[index].title ?? "",
                                description: cubit.search?[index].description ?? "",
                                price: cubit.search?[index].discountPercentage
                                    .toString() ?? "",
                                desPrice: cubit.search?[index].price.toString() ?? "",
                                rate: cubit.search?[index].rating.toString() ?? "",
                              );
                            },
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
