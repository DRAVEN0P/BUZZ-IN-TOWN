import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({super.key});

  @override
  State<GetLocation> createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  static const _initialCameraPosition = CameraPosition(
    target: destination,
    zoom: 14.5,
  );

  LocationData? currLocation;

  late LatLng latLngFinal;

  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  void getCurrentLocation() {
    Location location = Location();
    location.getLocation().then((location) {
      setState(() {
        currLocation = location;
      });
    });
  }

  void addMarker(LatLng l) {
    setState(() {
      marker.add(Marker(
        markerId: const MarkerId("source"),
        position: l,
      ));
    });
    latLngFinal = l;
  }

  Set<Marker> marker = {};

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
            context.pop(latLngFinal);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Pick Location"),
      ),
      body: currLocation == null
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: GoogleMap(
                  onTap: (l) {
                    addMarker(l);
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: _initialCameraPosition,
                  markers: marker),
            ),
    );
  }
}
