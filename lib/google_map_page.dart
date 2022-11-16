import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_live_tracker/provider/location_provider.dart';
import 'package:provider/provider.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  _GoogleMapState createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMapPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LocationProvider>(context, listen: false).initialization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Tracking Example"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: googleMapUI(),
    );
  }

  Widget googleMapUI() {
    return Consumer<LocationProvider>(builder: (
      consumerContext,
      model,
      child,
    ) {
      if (model.locationPosition != null) {
        print("Hello");
        return Column(
          children: [
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: model.locationPosition,
                  zoom: 18,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (GoogleMapController controller) {},
                mapType: MapType.normal,
              ),
            ),
          ],
        );
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
