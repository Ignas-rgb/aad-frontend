import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarkButton extends StatelessWidget {
  const MarkButton({
    required this.width,
    required this.onTap,
  });

  final double width;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.11,
        height: width * 0.0291,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xffff6a3d)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icons/exclude.png',
                width: width * 0.0083,
                height: width * 0.0104,
              ),
              SizedBox(
                width: width * 0.0083,
              ),
              SizedBox(
                width: width * 0.0838,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Pažymėti žemėlapyje',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
