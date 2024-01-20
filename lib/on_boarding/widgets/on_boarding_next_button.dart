import 'package:flutter/material.dart';
import 'package:heart/common_utils/colors.dart';
import 'package:heart/on_boarding/controller/on_boarding_controller.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  final DimensionProvider dimension;
  const OnBoardingNextButton({
    super.key,
    required this.dimension,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: dimension.width * 0.06,
      bottom: dimension.height * 0.08,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.loginButtonColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Icon(
          Iconsax.arrow_right_3,
        ),
      ),
    );
  }
}
