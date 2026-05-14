import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_ui/constant/app_assets.dart';
import 'package:ps_ui/theme/theme.dart';
import 'package:ps_ui/widget/text_label/text_label.dart';

class PSTableView extends StatelessWidget {
  final List<String> tableHeader;
  final List<List<dynamic>> tableRows;
  final Function(String?, String?) onTapInfo;
  final PSTableDataCellModel Function(dynamic) cellDataMapper;

  const PSTableView(
      {required this.tableHeader,
      required this.tableRows,
      required this.onTapInfo,
      required this.cellDataMapper,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          dividerTheme: const DividerThemeData(
            color: Colors.transparent,
            space: 0,
            thickness: 0,
            indent: 0,
            endIndent: 0,
          ),
          visualDensity:
              const VisualDensity(horizontal: VisualDensity.maximumDensity)), //
      child: SizedBox(
          width: double.maxFinite,
          child: Builder(builder: (content) {
            if (tableHeader.length <= 3) {
              return _dataTable;
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _dataTable,
            );
          })),
    );
  }

  Widget get _dataTable => DataTable(
        headingTextStyle: PSTextStyle.h5SemiBold(),
        dataRowMinHeight: 10,
        dataRowMaxHeight: 36,
        horizontalMargin: 4,
        headingRowHeight: 40,
        columnSpacing: 10,
        columns: List.generate(tableHeader.length, (index) {
          final isLast =
              index + 1 == tableHeader.length && tableHeader.length > 1;
          return DataColumn(
            label: Text(tableHeader[index]),
            headingRowAlignment:
                isLast ? MainAxisAlignment.end : MainAxisAlignment.start,
          );
        }),
        rows: List.generate(tableRows.length, (index) {
          // final isLast = index + 1 == header.length && header.length > 1;
          return DataRow(
              cells: List.generate(tableRows[index].length, (itemIndex) {
            final isLast = itemIndex + 1 == tableRows[index].length &&
                tableRows[index].length > 1;
            final cellData = tableRows[index][itemIndex];

            final PSTableDataCellModel cellMapped = cellDataMapper(cellData);
            return _tableCell(cellMapped, isLast: isLast);
          }));
        }),
      );

  DataCell _tableCell(PSTableDataCellModel item, {bool isLast = false}) {
    bool hasInfo = (item.info ?? "").isNotEmpty;
    return DataCell(
        Row(
          mainAxisAlignment:
              isLast ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            !item.highlight
                ? Text(
                    item.value,
                    style: PSTextStyle.h5Regular(),
                  )
                : Transform.translate(
                    offset: const Offset(-8, 0),
                    child: PSTextLabel(
                      text: item.value,
                      backgroundColor: item.highlightColor.toColor(),
                      textStyle: PSTextStyle.h5SemiBold(color: PSColors.white),
                    ),
                  ),
            if (hasInfo)
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: SvgPicture.asset(
                  PSAssets.icInfo,
                  height: 14,
                ),
              )
          ],
        ), onTap: () {
      if (hasInfo) {
        onTapInfo(item.value, item.info);
      }
    });
  }
}

class PSTableDataCellModel {
  String value;
  String? info;
  bool highlight;
  String highlightColor;

  PSTableDataCellModel({
    required this.value,
    required this.info,
    required this.highlight,
    required this.highlightColor,
  });

  factory PSTableDataCellModel.fromJson(Map<String, dynamic> json) =>
      PSTableDataCellModel(
        value: json["value"],
        info: json["info"],
        highlight: json["highlight"],
        highlightColor: json["highlightColor"],
      );
}

extension StringToColor on String {
  Color? toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return null;
  }
}
