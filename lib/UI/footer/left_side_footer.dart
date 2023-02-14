import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeftSideFooter extends StatelessWidget {
  const LeftSideFooter({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                'assets/icons/security_logo.png',
                height: width * 0.025,
                width: width * 0.025,
              ),
              SizedBox(
                width: width * 0.0083,
              ),
              SizedBox(
                width: width * 0.1744,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Aplinkos Apsaugos Departamentas',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: width * 0.0083,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: width * 0.033,
              ),
              Column(
                children: <Widget>[
                  Text(
                    'ADRESU:',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w600,
                      color: Color(0x660a3328),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.0021,
                  ),
                  SizedBox(
                    width: width * 0.073,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Biudžetinė įstaiga,\nSmolensko g. 15,\n03201 Vilnius',
                        style: GoogleFonts.raleway(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.0166,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/facebook.png',
                        height: width * 0.0146,
                        width: width * 0.0146,
                      ),
                      SizedBox(
                        width: width * 0.00625,
                      ),
                      Image.asset(
                        'assets/icons/linkedin.png',
                        height: width * 0.0146,
                        width: width * 0.0146,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                width: width * 0.025,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'TELEFONAS:',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w600,
                      color: Color(0x660a3328),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.0021,
                  ),
                  SizedBox(
                    width: width * 0.0572,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '(85) 216 3385',
                        style: GoogleFonts.raleway(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.00833,
                  ),
                  Text(
                    'EL. PAŠTAS:',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w600,
                      color: Color(0x660a3328),
                    ),
                  ),
                  SizedBox(
                    height: width * 0.0021,
                  ),
                  SizedBox(
                    width: width * 0.0572,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'info@aad.am.lt',
                        style: GoogleFonts.raleway(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
