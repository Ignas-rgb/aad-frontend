import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: width * 0.4234,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Padarykime Lietuvą švaresnę!',
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: width * 0.0104,
        ),
        SizedBox(
          width: width * 0.4166,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Pažymėkite žemėlapyje apie pastebėtas atliekas gamtoje. Aplinkos Apsaugos Departamento pareigūnai \n užtikrins, kad atliekos būtų pašalintos, o pažeidėjai nubausti.',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
