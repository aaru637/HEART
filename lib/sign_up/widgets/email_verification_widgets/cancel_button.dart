import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/login/screens/login.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';

class VerificationMailCancelButton extends StatelessWidget {
  final DimensionProvider dimension;
  const VerificationMailCancelButton({super.key, required this.dimension});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: dimension.width * 0.06),
      child: IconButton(
        iconSize: 30,
        onPressed: () => Get.off(
          () => const Login(),
          transition: Transition.native,
          duration: const Duration(seconds: 1),
        ),
        icon: Icon(
          CupertinoIcons.multiply,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
