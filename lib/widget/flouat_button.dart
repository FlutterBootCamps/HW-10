
import 'package:amc_applicaition/constant/colors.dart';
import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: darkBlue,
      onPressed: () {},
      child: const Icon(
        Icons.comment,
      ),
    );
  }
}