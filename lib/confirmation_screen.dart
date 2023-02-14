import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart' as mapsWeb;
import 'package:tvarkau_lietuva/UI/footer/footer.dart';
import 'package:tvarkau_lietuva/UI/widgets/department_logo.dart';
import 'package:tvarkau_lietuva/UI/report_table/report_table.dart';
import 'package:tvarkau_lietuva/data/models/place.dart';
import 'package:tvarkau_lietuva/main.dart';

import 'UI/adding_screen/cancel_button.dart';
import 'UI/adding_screen/mark_button.dart';
import 'UI/footer/copyright.dart';
import 'UI/footer/support_tag.dart';
import 'UI/widgets/background_widget.dart';
import 'UI/widgets/title_widget.dart';
import 'data/models/report.dart';
import 'package:http/http.dart' as http;

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({required this.width, super.key});

  final double width;

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f1ea),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: widget.width * 0.0125,
              ),
              DepartmentLogo(width: widget.width, color: Colors.black),
              SizedBox(
                height: widget.width * 0.0338,
              ),
              SizedBox(
                width: widget.width * 0.2823,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Dėkojame už jūsų pilietiškumą!',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: widget.width * 0.0338,
              ),
              Image.asset(
                'assets/icons/confirm.png',
                height: widget.width * 0.104,
                width: widget.width * 0.104,
              ),
              SizedBox(
                height: widget.width * 0.0338,
              ),
              SizedBox(
                width: widget.width * 0.150,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Pranešimas sėkmingai gautas.',
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: widget.width * 0.00625,
              ),
              SizedBox(
                width: widget.width * 0.25,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Aplinkos Apsaugos Departamento inspektoriai netrukus pradės\n darbuotis ieškodami pažeidėjo.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: widget.width * 0.04167,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) => const MyApp()));
                },
                child: Container(
                  width: widget.width * 0.11,
                  height: widget.width * 0.0291,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12), color: const Color(0xffff6a3d)),
                  child: Center(
                    child: SizedBox(
                      width: widget.width * 0.06,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Grįžti į svetainę',
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
