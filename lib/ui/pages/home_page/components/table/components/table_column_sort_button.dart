import 'package:flutter/material.dart';
import 'package:inventory_manager/resources/common_assets.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class TableColumnSortButton extends StatelessWidget {
  const TableColumnSortButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 14.toHeight,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(CommonAssets.topIndicator),
            ),
            SizedBox(
              height: 0.2.toHeight,
            ),
            Expanded(
              child: Image.asset(CommonAssets.bottomIndicator),
            ),
          ],
        ),
      ),
    );
  }
}
