import 'package:flutter/material.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class BottomModalShowButton extends StatelessWidget {
  const BottomModalShowButton({
    Key? key,
    required this.checkedProperties,
  }) : super(key: key);

  final List<bool> checkedProperties;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context, checkedProperties);
        },
        child: Container(
          height: 40.toHeight,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color(55529242),
                blurRadius: 24.toHeight,
                offset: const Offset(
                  0,
                  14,
                ),
              ),
            ],
            color: CommonColors.kSecondaryBLueColor,
            border: Border.all(
              color: CommonColors.kSecondaryBLueColor,
              width: 1.0,
              style: BorderStyle.solid,
              strokeAlign: StrokeAlign.inside,
            ),
            borderRadius: BorderRadius.circular(9.toHeight),
          ),
          child: Container(
            width: ScreenUtil.screenWidth - 60.toWidth,
            child: Center(
              child: Text(
                'Show',
                style: TextStyle(
                  fontSize: 16.toFont,
                  fontFamily: CommonFonts.Poppins,
                  fontWeight: FontWeight.w500,
                  color: CommonColors.kTextWhiteColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
