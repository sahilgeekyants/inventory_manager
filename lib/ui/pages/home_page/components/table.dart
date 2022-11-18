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
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomTable oldWidget) {
    allRecords = widget.allRecords;
    initialRecordNumber = allRecords.keys.toList()[0];
    properties = allRecords[initialRecordNumber]!.keys.toList();
    super.didUpdateWidget(oldWidget);
  }

  List<Widget> _buildCells(int count, List<String> data, bool isRecordNo) {
    return List.generate(
      count,
      (index) {
        return TableCell(
          data: data,
          isRecordNo: isRecordNo,
          index: index,
        );
      },
    );
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
            false,
          )
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
                                      TableColumnSortButton(
                                        onPressed: () {},
                                      ),
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
                                      TableColumnSortButton(
                                        onPressed: () {},
                                      ),
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
                left: -2.toWidth,
                child: Container(
                  width: 122.toWidth,
                  height: ((allRecords.keys.toList().length + 1) * 50).toHeight,
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
              Container(
                height: 575.toHeight,
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
                        blurRadius: 20,
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

class TableColumnSortButton extends StatelessWidget {
  const TableColumnSortButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
}

class TableCell extends StatelessWidget {
  final int index;
  final bool isRecordNo;
  final List<String> data;
  const TableCell({
    Key? key,
    required this.index,
    required this.isRecordNo,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data);
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
