import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:untitled/src/app/const/key.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  static const _initialCameraPosition = CameraPosition(
    target: destination,
    zoom: 14.5,
  );
  List<LatLng> polyCord = [];
  LocationData? currLocation;
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  void getCurrentLocation() {
    Location location = Location();
    location.getLocation().then((location) {
      setState(() {
        currLocation = location;
      });
    });
  }

  void getPolyPoint() async {
    PolylinePoints polylinePoints = PolylinePoints();
    polyCord = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: APIKEY,
      request: PolylineRequest(
        origin: PointLatLng(currLocation!.latitude!, currLocation!.longitude!),
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
      setState(() {});
    }
  }

  @override
  void initState() {
    getCurrentLocation();
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
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Direction"),
      ),
      body: currLocation == null
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                polylines: {
                  Polyline(
                    polylineId: PolylineId("routes"),
                    points: polyCord,
                    width: 3,
                  )
                },
                initialCameraPosition: _initialCameraPosition,
                markers: {
                  Marker(
                      markerId: const MarkerId("source"),
                      position: LatLng(
                          currLocation!.latitude!, currLocation!.longitude!)),
                  const Marker(
                      markerId: MarkerId("destination"), position: destination),
                },
              ),
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: Container(
          width: 55,
          height: 55,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              elevation: 0,
              onPressed: () {
                getPolyPoint();
              },
              child: Icon(Icons.location_on)),
        ),
      ),
    );
  }
}
