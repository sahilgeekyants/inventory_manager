import 'package:flutter/material.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/resources/common_fonts.dart';
import 'package:inventory_manager/ui/pages/home_page/components/table/components/table_column_sort_button.dart';
import 'package:inventory_manager/ui/pages/home_page/components/table/components/table_shadow.dart';
import 'package:inventory_manager/utils/constants/product_fields_data.dart';
import 'package:inventory_manager/utils/screen_util.dart';
import 'components/custom_table_cell.dart';

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

  List<Widget> _buildCells(int count, List<String?> data, bool isRecordNo) {
    return List<Widget>.generate(
      count,
      (index) {
        return CustomTableCell(
          index: index,
          isRecordNo: isRecordNo,
          data: data,
          isDropDown: ProductFieldsData.isFieldTypeDropDown(
            ProductFieldsData.getRecordFieldData(properties[index])[1],
          ),
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
                          width: 140.toWidth,
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
                                        "Serial No",
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
                          true,
                        ),
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
                                  width: 140.toWidth,
                                  height: 50.toHeight,
                                  color: CommonColors.kSecondaryBLueColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Spacer(
                                        flex: 1,
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          ProductFieldsData.getRecordFieldData(
                                              properties[index])[0],
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontFamily: CommonFonts.Poppins,
                                            color: CommonColors.kTextWhiteColor,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: TableColumnSortButton(
                                          onPressed: () {},
                                        ),
                                      ),
                                      const Spacer(
                                        flex: 1,
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
              ...TableShadow.getTableShadow(allRecords),
            ],
          ),
        ],
      ),
    );
  }
}
