// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';
import 'package:ps_ui/widget/scrollable_table/scrollable_table_style.dart';
export 'scrollable_table_style.dart';

class PSScrollableTable extends StatelessWidget {
  final List<List<String>> tableRows;
  final PSScrollableTableStyle style;

  const PSScrollableTable(
      {required this.tableRows, required this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: style.background,
        boxShadow: style.shadow,
        border: style.tableBorder,
        borderRadius: style.borderRadius,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                // color: Colors.red,
                border: style.separator,
              ),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: tableRows.mapIndexed((index, rowItems) {
                    return Container(
                      margin:
                          index == 0 ? null : const EdgeInsets.only(bottom: 8),
                      // color: Colors.amber,
                      child: cell(
                          Text(rowItems.first,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              // textScaleFactor: 0.9,
                              style: index == 0
                                  ? style.greyTextStyle
                                  : style.blackTextStyle),
                          align: CrossAxisAlignment.start),
                    );
                  }).toList()),
            ),
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Container(
              // color: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                    children: tableRows.mapIndexed((index, rowItems) {
                  return Container(
                      margin:
                          index == 0 ? null : const EdgeInsets.only(bottom: 8),
                      child: _tableRow(isHeader: index == 0, values: rowItems));
                }).toList()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableRow({bool isHeader = false, List<String> values = const []}) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: values.sublist(1, values.length).mapIndexed((index, rowItem) {
          // Split the dataValue into two parts
          final regex = RegExp(r'(\d+)\(([^)]+)\)');
          final match = regex.firstMatch(rowItem);
          String firstPart = match?.group(1) ?? "";
          if (firstPart.isEmpty) {
            firstPart = rowItem;
          }
          String secondPart = match?.group(2) ?? "";
          if (secondPart.isNotEmpty) {
            secondPart = "($secondPart)";
          }

          return Container(
            // color: Colors.blue,
            // margin: const EdgeInsets.only(bottom: 4),
            child: cell(
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: firstPart,
                      style:
                          isHeader ? style.greyTextStyle : style.blackTextStyle,
                    ),
                    TextSpan(
                      text: secondPart,
                      style: style.greyTextStyle,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              width: 100,
            ),
          );
        }).toList());
  }

  Widget cell(Widget text,
      {double width = 80,
      CrossAxisAlignment align = CrossAxisAlignment.center}) {
    return Padding(
      padding: align == CrossAxisAlignment.start
          ? const EdgeInsets.only(left: 10)
          : EdgeInsets.zero,
      child: SizedBox(
          height: 36,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: align,
            children: [
              text,
            ],
          )),
    );
  }
}
