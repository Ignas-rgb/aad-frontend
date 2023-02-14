import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place with ClusterItem {
  final String name;
  final LatLng latLng;
  final String? reportDate;

  Place({
    required this.name,
    required this.latLng,
    required this.reportDate,
  });

  @override
  LatLng get location => latLng;
}
