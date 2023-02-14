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

import 'UI/adding_screen/cancel_button.dart';
import 'UI/adding_screen/mark_button.dart';
import 'confirmation_screen.dart';
import 'data/models/report.dart';
import 'package:http/http.dart' as http;

class AddingScreen extends StatefulWidget {
  const AddingScreen({required this.width, required this.height, super.key});

  final double width;
  final double height;

  @override
  State<AddingScreen> createState() => _AddingScreenState();
}

class _AddingScreenState extends State<AddingScreen> {
  final _formKey = GlobalKey<FormState>();
  String currectTextValue = '';
  List<Marker> markers = [];
  double selectedLat = 0;
  double selectedLong = 0;
  final CameraPosition _lithuaniaCameraPosition =
      const CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 7.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f1ea),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widget.width * 0.1875,
                vertical: widget.width * 0.0167,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CancelButton(
                        width: widget.width,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const Spacer(),
                      MarkButton(
                        onTap: () {
                          if (_formKey.currentState!.validate() &&
                              selectedLat != 0 &&
                              selectedLong != 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Center(
                                  child: Text(
                                    'Siunčiami duomenys',
                                  ),
                                ),
                              ),
                            );
                            _sendData();
                          }
                        },
                        width: widget.width,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: widget.width * 0.0167,
                  ),
                  SizedBox(
                    width: widget.width * 0.2255,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Pranešti apie šiukšlinimą',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: widget.width * 0.0208,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: widget.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.783 - 60,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(32)),
                          child: GoogleMap(
                            initialCameraPosition: _lithuaniaCameraPosition,
                            onTap: _handleTap,
                            markers: markers.map((e) => e).toSet(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: widget.width * 0.0167,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widget.width * 0.065,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Pranešimo turinys',
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0x660a3328),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: widget.width * 0.0021,
                          ),
                          Container(
                            width: widget.width * 0.208,
                            height: widget.width * 0.125,
                            padding: EdgeInsets.all(
                              widget.width * 0.0083,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.circular(12)),
                            child: TextFormField(
                              maxLines: 10,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Prašome įvesti pranešimo turinį';
                                }
                                return null;
                              },
                              onChanged: (textValue) {
                                currectTextValue = textValue;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle:
                                    GoogleFonts.raleway(fontWeight: FontWeight.w500, fontSize: 16),
                                hintText: 'Parašykite savo tekstą čia...',
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<Report> _sendData() async {
    final response = await http.post(
      Uri.parse('https://aad-backend.onrender.com/reports'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        "name": currectTextValue,
        "reportLat": selectedLat,
        "reportLong": selectedLong,
        "isApproved": false
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ConfirmationScreen(
            width: widget.width,
          ),
        ),
      );
      return Report.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create report.');
    }
  }

  _handleTap(LatLng tappedPoint) {
    Marker newMarker = Marker(
      markerId: const MarkerId(
        '1',
      ),
      position: LatLng(
        tappedPoint.latitude,
        tappedPoint.longitude,
      ),
      draggable: true,
      onDrag: _handleDrag,
    );
    markers.add(newMarker);
    setState(() {
      selectedLat = tappedPoint.latitude;
      selectedLong = tappedPoint.longitude;
    });
  }

  _handleDrag(LatLng tappedPoint) {
    selectedLat = tappedPoint.latitude;
    selectedLong = tappedPoint.longitude;
  }
}
