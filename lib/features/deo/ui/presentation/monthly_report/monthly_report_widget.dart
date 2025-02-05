import 'package:flutter/material.dart';
import 'package:m11_ind/core/core.dart';

class MonthlyReportWidget extends StatelessWidget {
  const MonthlyReportWidget({super.key, required this.data, required this.headers});

  final List<String> headers;
  final List<Pair<String, double>> data;
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: headers.map((e) => buildTableHeader(e)).toList(),
        ),
        ...data
          .map((e) => TableRow(children: [
                buildTableCell(e.first),
                buildTableCell(e.second.toString()),
              ])),
      ]
    );
  }
}
