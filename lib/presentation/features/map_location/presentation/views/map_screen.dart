import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hts_plus/core/extensions/build_context_extensions.dart';
import 'package:hts_plus/presentation/features/dashboard/widgets/dashboard.dart';
import 'package:hts_plus/presentation/features/map_location/presentation/widgets/enter_location_buttom_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  static const String routeName = '/mapScreen';
  // static const routeName = '/';
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Completer<GoogleMapController> _googleMapsController = Completer();
  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    //_googleMapsController = GoogleMapController();
    super.initState();
  }

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(6.723354, 3.3937225),
    zoom: 18,
  );

  static final Marker _kGooglePlexMarker = const Marker(
      markerId: MarkerId(
        '_kGooglePlex',
      ),
      infoWindow: InfoWindow(title: 'Google Plex'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(6.723354, 3.3937225));

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static final Marker _kLakeMarker = Marker(
    markerId: const MarkerId(
      '_kLakeMarker',
    ),
    infoWindow: const InfoWindow(title: 'Lake Plex'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: const LatLng(37.43296265331129, -122.08832357078792),
  );

  static final Polyline _kPolyline = const Polyline(
      polylineId: PolylineId('_kPolyline'),
      points: [
        LatLng(6.723354, 3.3937225),
        LatLng(37.43296265331129, -122.08832357078792),
      ],
      width: 5);

  static final Polygon _kPolygon = const Polygon(
    polygonId: PolygonId('_kPolygon'),
  );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              markers: {
                _kGooglePlexMarker,
                _kLakeMarker,
              },
              polylines: {
                _kPolyline,
              },
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialCameraPosition,
              //onMapCreated: (controller) => _googleMapsController = controller),

              onMapCreated: (GoogleMapController controller) {
                _googleMapsController.complete(controller);
              },
            ),
            EnterLocationBottomWidget(
              onTap: _goToLocation,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _goToLocation() async {
   // final GoogleMapController controller = await _googleMapsController.future;
    context.pushNamed(DashBoard.routeName);
    // controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
