import 'package:flutter/material.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class BottomModalSearchBox extends StatelessWidget {
  const BottomModalSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.toHeight,
      child: TextField(
        style: TextStyle(
          color: CommonColors.kBlackIconColor,
          fontSize: 14.toFont,
          fontFamily: CommonFonts.Poppins,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 10.toWidth,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.toWidth),
              borderSide: const BorderSide(
                color: CommonColors.kTextFieldColor,
              ),
            ),
            hintText: "Search",
            hintStyle: TextStyle(
              color: CommonColors.kTextFieldColor,
              fontSize: 14.toFont,
              fontFamily: CommonFonts.Poppins,
              fontWeight: FontWeight.w300,
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30.toHeight,
                color: CommonColors.kSearchButtonColor,
              ),
            )),
      ),
    );
  }
}
