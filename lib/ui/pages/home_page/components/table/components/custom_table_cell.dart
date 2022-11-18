import 'package:flutter/material.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class CustomTableCell extends StatelessWidget {
  final int index;
  final bool isRecordNo;
  final List<String?> data;
  final bool isDropDown;
  const CustomTableCell({
    Key? key,
    required this.index,
    required this.isRecordNo,
    required this.data,
    required this.isDropDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("$index, ${data[index]}");
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.toWidth,
      ),
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
      width: 140.toWidth,
      height: 50.toHeight,
      child: isRecordNo
          ? Text(
              data[index]!,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontFamily: CommonFonts.Poppins,
                color: CommonColors.kTextColorLight,
                fontSize: 12.toFont,
                fontWeight: FontWeight.w400,
              ),
            )
          : data[index] != null
              ? isDropDown
                  ? DropdownButton(
                      items: List.generate(data[index]!.split(',').length,
                          (index) {
                        return DropdownMenuItem(
                            child: Text(
                          data[index]!.split(',')[index],
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontFamily: CommonFonts.Poppins,
                            color: CommonColors.kTextColorLight,
                            fontSize: 12.toFont,
                            fontWeight: FontWeight.w400,
                          ),
                        ));
                      }),
                      onChanged: ((value) {}),
                    )
                  : Text(
                      data[index]!,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontFamily: CommonFonts.Poppins,
                        color: CommonColors.kTextColorLight,
                        fontSize: 12.toFont,
                        fontWeight: FontWeight.w400,
                      ),
                    )
              : Text("-"),
    );
  }
}
