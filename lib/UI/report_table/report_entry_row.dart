import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/place.dart';

class ReportEntryRow extends StatelessWidget {
  const ReportEntryRow({
    required this.width,
    required this.report,
  });

  final double width;
  final Place report;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width * 0.0416,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: width * 0.0963,
                child: Text(
                  report.reportDate.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.00833,
              ),
              SizedBox(
                width: width * 0.0963,
                child: Text(
                  report.latLng.longitude.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.00833,
              ),
              SizedBox(
                width: width * 0.0963,
                child: Text(
                  report.latLng.latitude.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.00833,
              ),
              SizedBox(
                width: width * 0.0963,
                child: Text(
                  report.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.00833,
              ),
              SizedBox(
                width: width * 0.0963,
                child: Text(
                  'Vilniaus valdyba',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.00833,
              ),
              SizedBox(
                width: width * 0.0963,
                child: Text(
                  'Gautas',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 1,
            color: Color.fromRGBO(10, 51, 40, 0.1),
          )
        ],
      ),
    );
  }
}
