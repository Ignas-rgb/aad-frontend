import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RightSideFooter extends StatelessWidget {
  const RightSideFooter({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: width * 0.0817,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'tvarkaulietuva.lt',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff2a6354),
                ),
              ),
            ),
          ),
          SizedBox(
            height: width * 0.005,
          ),
          SizedBox(
            width: width * 0.2333,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Tai bandomoji sistemos versija, skirta viešinti visus Aplinkos Apsaugos \nDepartamentui žinomas ir potencialiai nelegalias atliekų susidarymo vietas. \nSistemoje suteikiama galimybė visuomenei pranešti apie dar neužfiksuotas vietas, \nbei sekti jų nagrinėjimo situaciją.',
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
