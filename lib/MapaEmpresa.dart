import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapaEmpresa extends StatelessWidget {
  final String latitude;
  final String longitude;

  MapaEmpresa({required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localização da Empresa'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(double.parse(latitude), double.parse(longitude)),
          initialZoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.app',
          ),
          // MarkerLayer(
          //   markers: [
          //     Marker(
          //       point: LatLng(double.parse(latitude), double.parse(longitude)),
          //       width: 80,
          //       height: 80,
          //       builder: (ctx) => Icon(
          //         Icons.location_on,
          //         color: Colors.red,
          //         size: 40.0,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
