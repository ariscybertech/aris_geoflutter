import 'package:flutter/material.dart';
import 'package:flutter_geofence/geofence.dart';
import 'package:geolocator/geolocator.dart';
import './geo_view_view_model.dart';

class GeoViewView extends GeoViewViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addGeoFance();
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.location_city),
          onPressed: () {
            Geolocator().getCurrentPosition().then((value) {
              print(value.latitude);
              print(value.longitude);
            });
          },
        ),
        title: Text(location),
      ),
    );
  }
}
