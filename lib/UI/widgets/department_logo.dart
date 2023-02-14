import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DepartmentLogo extends StatelessWidget {
  const DepartmentLogo({
    required this.width,
    required this.color,
  });

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.134,
      height: width * 0.025,
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/icons/security_logo.png',
            height: width * 0.025,
            width: width * 0.025,
          ),
          SizedBox(
            width: width * 0.00625,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: width * 0.0791,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Tvarkau Lietuvą',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700,
                      color: color,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.00104,
              ),
              SizedBox(
                width: width * 0.1026,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Aplinkos Apsaugos Departamentas',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                      color: color,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
