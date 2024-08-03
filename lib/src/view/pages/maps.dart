import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/src/app/const/key.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  static const _initialCameraPosition = CameraPosition(
    target: sourceLocation,
    zoom: 14.5,
  );

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);
  List<LatLng> polyCord = [];

  void getPolyPoint() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: APIKEY,
      request: PolylineRequest(
        origin: PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        destination: PointLatLng(destination.latitude, destination.longitude),
        mode: TravelMode.driving,
      ),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polyCord.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
    }
  }

  @override
  void initState() {
    getPolyPoint();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go("/home");
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Direction"),
      ),
      body: GoogleMap(
        polylines: {
          Polyline(
            polylineId: PolylineId("routes"),
            points: polyCord,
            width: 3,
          )
        },
        initialCameraPosition: _initialCameraPosition,
        markers: {
          Marker(markerId: MarkerId("source"), position: sourceLocation),
          Marker(markerId: MarkerId("destination"), position: destination),
        },
      ),
    );
  }
}
