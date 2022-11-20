import 'package:flutter/material.dart';
import 'package:inventory_manager/resources/common_colors.dart';
import 'package:inventory_manager/utils/screen_util.dart';

class TableShadow {
  static List<Widget> getTableShadow(
      Map<String, Map<String, dynamic>> allRecords) {
    return [
      Positioned(
        left: -2.toWidth,
        child: Container(
          width: 90.toWidth,
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
          width: 90.toWidth,
          height: ((allRecords.keys.toList().length + 1) * 50).toHeight -
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
    ];
  }
}
