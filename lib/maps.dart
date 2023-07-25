import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({super.key});

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    const CameraPosition _yutakanaFarmCoordinate = CameraPosition(
      target: LatLng(0, 0),
      zoom: 0,
    );

    final Uri _url = Uri.parse(
        'https://www.google.com/maps/place/Yutakana+Farm/@-6.5474536,106.938068,17z/data=!3m1!4b1!4m6!3m5!1s0x2e69b94e6c126405:0x96267b70ebfbe9a6!8m2!3d-6.5474589!4d106.9406429!16s%2Fg%2F11kq5lrfqb?entry=ttu');

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      // color: ColorConstants.darkGreen,
      child: GoogleMap(
        onTap: (latLng) async {},
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: _yutakanaFarmCoordinate,
      ),
    );
  }
}
