import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tvarkau_lietuva/UI/footer/left_side_footer.dart';
import 'package:tvarkau_lietuva/UI/footer/right_side_footer.dart';

class Footer extends StatelessWidget {
  const Footer({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LeftSideFooter(
          width: width,
        ),
        const Spacer(),
        RightSideFooter(
          width: width,
        ),
      ],
    ));
  }
}
