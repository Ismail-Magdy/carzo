import 'package:carzo/features/home/presentation/widgets/custom_brand_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/constants.dart';

class CustomBrandsRow extends StatelessWidget {
  const CustomBrandsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceAround,
      children: [
        //
        CustomBrandItem(
          image: "assets/images/brands/BMW.png",
          text: "BMW",
          onTap: () {
            masterBrandName = "BMW";
            // TODO :
            // context.pushNamed(Routes.brandsCarsView);
          },
        ),
        //
        CustomBrandItem(
          image: "assets/images/brands/Mercedes-Benz.png",
          text: "Mercedes",
          onTap: () {
            masterBrandName = "Mercedes-Benz";
            // TODO :
            // context.pushNamed(Routes.brandsCarsView);
          },
        ),
        //
        CustomBrandItem(
          image: "assets/images/brands/Audi.png",
          text: "Audi",
          onTap: () {
            masterBrandName = "Audi";
            // TODO :
            // context.pushNamed(Routes.brandsCarsView);
          },
        ),
        //
        CustomBrandItem(
          image: "assets/images/brands/Kia.png",
          text: "Kia",
          onTap: () {
            masterBrandName = "Kia";
            // TODO :
            // context.pushNamed(Routes.brandsCarsView);
          },
        ),
        //
      ],
    );
  }
}
