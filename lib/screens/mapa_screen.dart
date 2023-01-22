import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition _puntInicial = CameraPosition(
      target: scan.getLatLng(),
      zoom: 14.4746,
      tilt: 50,
    );

    Set<Marker> markers = new Set<Marker>();
    markers.add(
      new Marker(
        markerId: MarkerId('id1'),
        position: scan.getLatLng(),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(Icons.center_focus_strong_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        markers: markers,
        initialCameraPosition: _puntInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
