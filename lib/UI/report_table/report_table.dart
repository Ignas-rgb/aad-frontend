import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tvarkau_lietuva/UI/report_table/report_entry_row.dart';
import 'package:tvarkau_lietuva/UI/report_table/report_title_bar.dart';

import '../../data/models/place.dart';

class ReportTable extends StatelessWidget {
  const ReportTable({
    required this.width,
    required this.reports,
  });

  final List<Place> reports;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.625,
      height: width * 0.28,
      child: Column(
        children: <Widget>[
          ReportTitleBar(width: width),
          const Divider(
            height: 1,
            color: Color.fromRGBO(10, 51, 40, 0.1),
          ),
          SizedBox(
            height: width * 0.254,
            child: ListView.builder(
                itemCount: reports.length,
                itemBuilder: (BuildContext context, int index) {
                  return ReportEntryRow(width: width, report: reports[index],);
                }),
          )
        ],
      ),
    );
  }
}
