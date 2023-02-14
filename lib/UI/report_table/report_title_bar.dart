import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportTitleBar extends StatelessWidget {
  const ReportTitleBar({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: width * 0.0963,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Pranešimo data ir laikas',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w600,
                color: Color(0x660a3328),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.0963,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Koordinatės ilguma',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w600,
                color: Color(0x660a3328),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.0963,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Koordinatės platuma',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w600,
                color: Color(0x660a3328),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.0963,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Pranešimo turinys',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w600,
                color: Color(0x660a3328),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.0963,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'AAD atsakymas',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w600,
                color: Color(0x660a3328),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.00833,
        ),
        SizedBox(
          width: width * 0.0963,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Pranešimo statusas',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w600,
                color: Color(0x660a3328),
              ),
            ),
          ),
        ),

      ],
    );
  }}