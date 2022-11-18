import 'package:flutter/material.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class BottomModalFiltersList extends StatelessWidget {
  const BottomModalFiltersList({
    Key? key,
    required this.properties,
    required this.checkedProperties,
  }) : super(key: key);

  final List<String> properties;
  final List<bool> checkedProperties;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 2.toWidth,
      ),
      width: MediaQuery.of(context).size.width,
      height: 200.toHeight,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          children: List.generate(
            properties.length,
            (index) {
              return Container(
                width: (MediaQuery.of(context).size.width / 2) - 20.toWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StatefulBuilder(
                      builder: (context, setState) {
                        return SizedBox(
                          height: 35.toHeight,
                          width: 20.toWidth,
                          child: Transform.scale(
                            scale: MediaQuery.of(context).size.height >= 1000
                                ? 1.4
                                : 1,
                            child: Checkbox(
                              side: BorderSide(
                                width: 1.toHeight,
                                color: CommonColors.kTextColorLight,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  4.toHeight,
                                ),
                              ),
                              // activeColor:
                              //     CommonColors.kSecondaryBLueColor,
                              fillColor: MaterialStateProperty.all(
                                CommonColors.kSecondaryBLueColor,
                              ),
                              checkColor: CommonColors.kTextWhiteColor,
                              value: checkedProperties[index],
                              onChanged: (value) {
                                setState(() {
                                  checkedProperties[index] = value!;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: 10.toWidth,
                    ),
                    Text(
                      properties[index],
                      style: TextStyle(
                        fontFamily: CommonFonts.Poppins,
                        fontSize: 12.toFont,
                        color: CommonColors.kTextColorLight,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
