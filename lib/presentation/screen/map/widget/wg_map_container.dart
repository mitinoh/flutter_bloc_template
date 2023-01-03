import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc_template/presentation/screen/map/widget/wg_map_layout.dart';

class MapContainer extends StatelessWidget {
  MapContainer({Key? key, required this.userPosition}) : super(key: key);
  final Position userPosition;

  @override
  Widget build(context) {
    return MapLayout(
      userPosition: userPosition
    );
  }
}
