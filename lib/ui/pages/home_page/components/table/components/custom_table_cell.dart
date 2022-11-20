import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/utils/screen_util.dart';
import 'package:flutter/services.dart';

class CustomTableCell extends StatelessWidget {
  final int index;
  final bool isRecordNo;
  final List<String?> data;
  final bool isDropDown;
  final double width;
  final bool isClickable;
  const CustomTableCell({
    Key? key,
    required this.index,
    required this.isRecordNo,
    required this.data,
    required this.isDropDown,
    required this.width,
    required this.isClickable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("$index, ${data[index]}");
    return GestureDetector(
      onTap: () async {
        if (data[index] != null) {
          await Clipboard.setData(ClipboardData(text: data[index]));
          Fluttertoast.showToast(
            msg: "Copied",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: CommonColors.kBlackIconColor,
            textColor: CommonColors.kTextWhiteColor,
            fontSize: 12.toFont,
          );
        }
      },
      child: Container(
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
          width: width,
          height: 50.toHeight,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Center(
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
                                  items: List.generate(
                                      data[index]!.split(',').length, (index2) {
                                    return DropdownMenuItem(
                                        child: Text(
                                      data[index]!.split(',')[index2],
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
                )
              ],
            ),
          )),
    );
  }
}
