import 'package:flutter/material.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class CustomTableCell extends StatelessWidget {
  final int index;
  final bool isRecordNo;
  final List<String> data;
  const CustomTableCell({
    Key? key,
    required this.index,
    required this.isRecordNo,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CommonColors.kTableBorderColor,
            width: 2.toHeight,
          ),
          left: isRecordNo
              ? BorderSide(
                  color: CommonColors.kTableBorderColor,
                  width: 2.toHeight,
                )
              : const BorderSide(
                  width: 0,
                  color: CommonColors.kTransparentColor,
                ),
          right: !isRecordNo
              ? index == data.length - 1
                  ? BorderSide(
                      color: CommonColors.kTableBorderColor,
                      width: 2.toHeight,
                    )
                  : const BorderSide(
                      width: 0,
                      color: CommonColors.kTransparentColor,
                    )
              : const BorderSide(
                  width: 0,
                  color: CommonColors.kTransparentColor,
                ),
        ),
        color: CommonColors.kTextWhiteColor,
      ),
      alignment: Alignment.center,
      width: 120.toWidth,
      height: 50.toHeight,
      child: index != 2 || isRecordNo
          ? Text(
              data[index],
              style: TextStyle(
                  fontFamily: CommonFonts.Poppins,
                  color: CommonColors.kTextColorLight,
                  fontSize: 12.toFont,
                  fontWeight: FontWeight.w400),
            )
          : DropdownButton(
              items: const [
                DropdownMenuItem(
                  child: Text("Region"),
                ),
              ],
              onChanged: null,
            ),
    );
  }
}
