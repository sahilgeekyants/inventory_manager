import 'package:flutter/material.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/utils/constants/strings.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class BottomModalCityContainer extends StatelessWidget {
  const BottomModalCityContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.toHeight,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CommonColors.kBorderLightGrey,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.city,
            style: TextStyle(
              color: CommonColors.kBlackIconColor,
              fontFamily: CommonFonts.Poppins,
              fontSize: 16.toFont,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 35.toHeight,
          ),
        ],
      ),
    );
  }
}
