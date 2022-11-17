// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inventory_manager/resources/common_assets.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class CustomTable extends StatefulWidget {
  final Map<String, Map<String, dynamic>> allRecords;
  const CustomTable({
    Key? key,
    required this.allRecords,
  }) : super(key: key);
  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  late String initialRecordNumber;
  late List<String> properties;
  late Map<String, Map<String, dynamic>> allRecords;
  @override
  void initState() {
    allRecords = widget.allRecords;
    initialRecordNumber = allRecords.keys.toList()[0];
    properties = allRecords[initialRecordNumber]!.keys.toList();
    print(properties);
    // print(allRecords);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomTable oldWidget) {
    print("Inside didupdate");
    allRecords = widget.allRecords;
    initialRecordNumber = allRecords.keys.toList()[0];
    properties = allRecords[initialRecordNumber]!.keys.toList();
    print(properties);
    super.didUpdateWidget(oldWidget);
  }

  Widget sortButton() {
    return GestureDetector(
      onTap: () {
        //Code for what happens on click of sort button
      },
      child: Container(
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

  List<Widget> _buildCells(int count, List<String> data, bool isRecordNo) {
    return List.generate(count, (index) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: CommonColors.kTableBorderColor,
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
                style: const TextStyle(
                  fontFamily: CommonFonts.Poppins,
                  color: CommonColors.kTextColorLight,
                ),
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
    });
  }

  List<Widget> _buildRows(int count) {
    return List.generate(
      count,
      (index) => Row(
        children: [
          ..._buildCells(
              properties.length,
              List.generate(
                properties.length,
                (index2) {
                  if (properties[index2].toLowerCase() == "region") {
                    return "Region";
                  }
                  return allRecords[allRecords.keys.toList()[index]]![
                      properties[index2]];
                },
              ),
              false)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 10.toWidth,
      ),
      height: 575.toHeight,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 120.toWidth,
                          height: 50.toHeight,
                          decoration: const BoxDecoration(
                            color: CommonColors.kSecondaryBLueColor,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Record No",
                                        style: TextStyle(
                                          fontFamily: CommonFonts.Poppins,
                                          color: CommonColors.kTextWhiteColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.toWidth,
                                      ),
                                      sortButton(),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 1.toWidth,
                                color: CommonColors.kTextWhiteColor,
                              ),
                            ],
                          ),
                        ),
                        ..._buildCells(
                            allRecords.keys.toList().length,
                            List.generate(allRecords.length, (index) {
                              return allRecords.keys.toList()[index];
                            }),
                            true),
                      ],
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(
                              properties.length,
                              (index) {
                                return Container(
                                  alignment: Alignment.center,
                                  width: 120.toWidth,
                                  height: 50.toHeight,
                                  color: CommonColors.kSecondaryBLueColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${properties[index]}",
                                        style: const TextStyle(
                                          fontFamily: CommonFonts.Poppins,
                                          color: CommonColors.kTextWhiteColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.toWidth,
                                      ),
                                      sortButton(),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          ..._buildRows(
                            allRecords.keys.toList().length,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                child: Container(
                  width: 120.toWidth,
                  height: ((allRecords.keys.toList().length - 1) * 50).toHeight,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: CommonColors.kTableBorderColor,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(
                          0,
                          0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  width: 120.toWidth,
                  height:
                      ((allRecords.keys.toList().length + 1) * 50).toHeight -
                          1.toHeight,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: CommonColors.kBlackShadowColor,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(
                          0,
                          0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
