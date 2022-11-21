import 'package:flutter/material.dart';
import 'package:inventory_manager/resources/common_colors.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      backgroundColor: CommonColors.kSecondaryBLueColor,
    ));
  }
}
