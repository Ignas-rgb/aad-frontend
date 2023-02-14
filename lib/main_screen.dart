import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart' as mapsWeb;
import 'package:tvarkau_lietuva/UI/footer/footer.dart';
import 'package:tvarkau_lietuva/UI/widgets/department_logo.dart';
import 'package:tvarkau_lietuva/UI/report_table/report_table.dart';
import 'package:tvarkau_lietuva/adding_screen.dart';
import 'package:tvarkau_lietuva/data/models/place.dart';

import 'UI/footer/copyright.dart';
import 'UI/footer/support_tag.dart';
import 'UI/widgets/background_widget.dart';
import 'UI/widgets/title_widget.dart';

import 'data/models/report.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({required this.reports, super.key});

  final List<Report> reports;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ClusterManager _manager;

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = Set();

  final CameraPosition _lithuaniaCameraPosition =
      CameraPosition(target: LatLng(55.1736, 23.8948), zoom: 7.0);

  List<Place> items = [];

  @override
  void initState() {
    widget.reports.forEach((e) {
      items.add(Place(
        name: e.name!,
        latLng: LatLng(e.reportLat!, e.reportLong!),
        reportDate: e.reportDate,
      ));
    });
    _manager = _initClusterManager();
    super.initState();
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<Place>(items, _updateMarkers, markerBuilder: _markerBuilder);
  }

  void _updateMarkers(Set<Marker> markers) {
    setState(() {
      this.markers = markers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            BackgroundWidget(width: constraints.maxWidth),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.1875,
                vertical: constraints.maxWidth * 0.0083,
              ),
              child: Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: DepartmentLogo(
                        width: constraints.maxWidth,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: constraints.maxWidth * 0.058,
                  ),
                  TitleWidget(width: constraints.maxWidth),
                  SizedBox(
                    height: constraints.maxWidth * 0.0291,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: constraints.maxWidth * 0.354,
                        width: constraints.maxWidth * 0.625,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(32)),
                          child: GoogleMap(
                            zoomGesturesEnabled: true,
                            zoomControlsEnabled: true,
                            mapType: MapType.normal,
                            initialCameraPosition: _lithuaniaCameraPosition,
                            markers: markers,
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                              _manager.setMapId(controller.mapId);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AddingScreen(
                                    width: constraints.maxWidth,
                                    height: constraints.maxHeight,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: constraints.maxWidth * 0.1411,
                              height: constraints.maxWidth * 0.0307,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xffff6a3d),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/exclude.png',
                                    width: constraints.maxWidth * 0.0083,
                                    height: constraints.maxWidth * 0.0104,
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * 0.0083,
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * 0.0974,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        'Pranešti apie šiukšlinimą',
                                        style: GoogleFonts.raleway(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: constraints.maxWidth * 0.033,
                  ),
                  ReportTable(
                    width: constraints.maxWidth,
                    reports: items,
                  ),
                  SizedBox(height: constraints.maxWidth * 0.066),
                  const Divider(
                    height: 1,
                    color: Color.fromRGBO(10, 51, 40, 0.1),
                  ),
                  SizedBox(height: constraints.maxWidth * 0.0343),
                  Footer(
                    width: constraints.maxWidth,
                  ),
                  SizedBox(height: constraints.maxWidth * 0.0166),
                  const Divider(
                    height: 1,
                    color: Color.fromRGBO(10, 51, 40, 0.1),
                  ),
                  SizedBox(height: constraints.maxWidth * 0.0166),
                  Row(
                    children: <Widget>[
                      Copyright(
                        width: constraints.maxWidth,
                      ),
                      const Spacer(),
                      SupportTag(
                        width: constraints.maxWidth,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder => (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            cluster.items.forEach((p) => print(p));
          },
          infoWindow: cluster.isMultiple
              ? const InfoWindow()
              : InfoWindow(
                  title: cluster.location.latitude.toString() +
                      ' | ' +
                      cluster.location.longitude.toString(),
                ),
          icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = Colors.orange;
    final Paint paint2 = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(fontSize: size / 3, color: Colors.white, fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}
