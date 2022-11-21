import 'package:flutter/material.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/ui/pages/home_page/components/bottom_modal_sheet/components/bottom_modal_city_container.dart';
import 'package:inventory_manager/ui/pages/home_page/components/bottom_modal_sheet/components/bottom_modal_filters.dart';
import 'package:inventory_manager/ui/pages/home_page/components/bottom_modal_sheet/components/bottom_modal_search_box.dart';
import 'package:inventory_manager/ui/pages/home_page/components/bottom_modal_sheet/components/bottom_modal_show_button.dart';
import 'package:inventory_manager/ui/pages/home_page/components/bottom_modal_sheet/components/bottom_modal_status.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class BottomModalWidget extends StatefulWidget {
  const BottomModalWidget({
    Key? key,
    required this.context,
    required this.properties,
    required this.checkedProperties,
  }) : super(key: key);

  final BuildContext context;
  final List<String> properties;
  final List<bool> checkedProperties;

  @override
  State<BottomModalWidget> createState() => _BottomModalWidgetState();
}

class _BottomModalWidgetState extends State<BottomModalWidget> {
  late List<String> properties;
  late List<bool> checkedProperties;
  RangeValues _currentRangeValues = const RangeValues(0, 30);
  @override
  void initState() {
    checkedProperties = widget.checkedProperties;
    properties = widget.properties;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.toHeight,
          horizontal: 20.toWidth,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.toHeight),
            topRight: Radius.circular(10.toHeight),
          ),
        ),
        height: 700.toHeight,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    //ON tap of back button
                    Navigator.pop(context, checkedProperties);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: CommonColors.kBlackIconColor,
                    size: 21.toHeight,
                  ),
                ),
                Text(
                  "Filter",
                  style: TextStyle(
                    fontFamily: CommonFonts.Poppins,
                    fontSize: 16.toFont,
                    color: CommonColors.kBlackIconColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    List<bool> newList = List.generate(
                      checkedProperties.length,
                      (index) => true,
                    );
                    setState(
                      () {
                        checkedProperties = newList;
                      },
                    );
                  },
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      fontFamily: CommonFonts.Poppins,
                      fontSize: 16.toFont,
                      color: CommonColors.kSecondaryBLueColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.toHeight,
            ),
            const BottomModalSearchBox(),
            SizedBox(
              height: 20.toHeight,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Filter By Category",
                  style: TextStyle(
                    fontFamily: CommonFonts.Poppins,
                    fontSize: 16.toFont,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 5.toHeight,
                ),
                BottomModalFiltersList(
                  properties: properties,
                  checkedProperties: checkedProperties,
                ),
                const BottomModalStatusContainer(),
                const BottomModalCityContainer(),
                Container(
                  height: 120.toHeight,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: CommonColors.kBorderLightGrey,
                      ),
                      bottom: BorderSide(
                        color: CommonColors.kBorderLightGrey,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Batch ID",
                            style: TextStyle(
                              color: CommonColors.kBlackIconColor,
                              fontFamily: CommonFonts.Poppins,
                              fontSize: 16.toFont,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "1-100",
                            style: TextStyle(
                              color: CommonColors.kSecondaryBLueColor,
                              fontFamily: CommonFonts.Poppins,
                              fontSize: 16.toFont,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // Icon()
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 1.toHeight,
                        ),
                        child: RangeSlider(
                          inactiveColor: CommonColors.kBlackIconColor,
                          activeColor: CommonColors.kSecondaryBLueColor,
                          values: _currentRangeValues,
                          max: 100,
                          labels: RangeLabels(
                            _currentRangeValues.start.round().toString(),
                            _currentRangeValues.end.round().toString(),
                          ),
                          onChanged: (RangeValues values) {
                            setState(() {
                              _currentRangeValues = values;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                BottomModalShowButton(checkedProperties: checkedProperties),
              ],
            )
          ],
        ),
      ),
    );
  }
}
