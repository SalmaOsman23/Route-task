

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:route_task/core/home_screen/presentation/bloc/home_cubit.dart';
import 'package:route_task/core/widgets/form_field_widget.dart';
import 'package:route_task/utils/app_colors.dart';


class SearchAndCartComponent extends StatelessWidget {
  const SearchAndCartComponent({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 9,
          child: SizedBox(
            height: 55,
            child: FormFiledWidget(
              onChanged: (value){
              },
              label: "What do you search for?",
              hintText: "What do you search for?",
              
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              IconlyLight.buy,
              size: 35,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
