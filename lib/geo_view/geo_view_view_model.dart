import 'package:flutter_geofence/geofence.dart';
import 'package:geolocator/geolocator.dart';

import 'geo_view.dart';
import 'package:flutter/material.dart';

import 'notification/local_notification.dart' as notif;

// import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
//     as bg;
const String fetchBackground = "fetchBackground";

abstract class GeoViewViewModel extends State<GeoView> {
  // Add your state and logic here

  String location = "";

  @override
  void initState() {
    super.initState();

    // Study().adapt(schema)

    // ContextSamplingPackage().

    // IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
    // port.listen((dynamic data) {
    //   // do something with data
    //   print(data);
    // });
    // initPlatformState();
    // startLocationService();

    Geofence.initialize();
    Geofence.requestPermissions();
    Geofence.startListening(GeolocationEvent.entry, (foo) {
      print("OK");
      notif.Notification notification = notif.Notification();
      notification.showNotificationWithoutSound(
          Position(latitude: foo.latitude, longitude: foo.longitude));
    });

    Geofence.startListening(GeolocationEvent.exit, (foo) {
      print("OK");
      notif.Notification notification = notif.Notification();
      notification.showNotificationWithoutSound(
          Position(latitude: foo.latitude, longitude: foo.longitude));
    });
    Geofence.getCurrentLocation().then((coordinate) {
      print(
          "Your latitude is ${coordinate.latitude} and longitude ${coordinate.longitude}");
    });

    Geofence.startListening(GeolocationEvent.entry, (entry) {
      print(entry.latitude);
      // notif.Notification notification = notif.Notification();
      // notification.showNotificationWithoutSound(
      //     Position(latitude: entry.latitude, longitude: entry.longitude));
      // scheduleNotification("Entry of a georegion", "Welcome to: ${entry.id}");
    });
    // Geolocator().checkGeolocationPermissionStatus();

    // Workmanager.initialize(
    //   callbackDispatcher,
    //   isInDebugMode: true,
    // );

    // Workmanager.
    // Workmanager.registerPeriodicTask(
    //   "1",
    //   fetchBackground,
    //   frequency: Duration(minutes: 5),
    // );
    Geolocator()
        .checkGeolocationPermissionStatus(
            locationPermission: GeolocationPermission.locationAlways)
        .then((value) {
      print(value);
    });
    // //  Geolocator().
    Geolocator()
        .getPositionStream(
            LocationOptions(
                accuracy: LocationAccuracy.high, distanceFilter: 10),
            GeolocationPermission.locationAlways)
        .listen((event) {
      print(event.toString());
      notif.Notification notification = notif.Notification();
      notification.showNotificationWithoutSound(event);
    });
  }
}

void addGeoFance() {
  Geofence.addGeolocation(
          Geolocation(
            id: "VBHOME",
            latitude: 40.9184,
            longitude: 29.2205,
            radius: 150,
          ),
          GeolocationEvent.entry)
      .then((onValue) {
    print("ADDED");
    // scheduleNotification("Georegion added", "Your geofence has been added!");
  }).catchError((error) {
    print("failed with $error");
  });
}

void geoFance() {
  // Future.microtask(() {
  //   Geofence.initialize();
  //   Geofence.requestPermissions();
  //   Geofence.getCurrentLocation().then((coordinate) {
  //     Geofence.addGeolocation(
  //             Geolocation(
  //                 latitude: coordinate.latitude,
  //                 longitude: coordinate.longitude,
  //                 radius: 50),
  //             GeolocationEvent.entry)
  //         .then((onValue) {
  //       Geofence.startListening(GeolocationEvent.entry, (entry) {
  //         print(entry.radius);
  //       });
  //       // print(entry.radius);
  //     }).catchError((error) {
  //       print("failed with $error");
  //     });
  //     print(
  //         "Your latitude is ${coordinate.latitude} and longitude ${coordinate.longitude}");
  //   });
  // });
}

void callbackDispatcher() {
  // Workmanager.executeTask((task, inputData) async {
  //   // Prin(task);,
  //   print(task);
  //   switch (task) {
  //     case fetchBackground:
  //       Position userLocation = await Geolocator()
  //           .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //       notif.Notification notification = notif.Notification();
  //       notification.showNotificationWithoutSound(userLocation);
  //       // print(userLocation.toString());
  //       break;
  //     case Workmanager.iOSBackgroundTask:
  //       print(task);
  //       print("Veli");
  //       Position userLocation = await Geolocator()
  //           .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //       notif.Notification notification = notif.Notification();
  //       notification.showNotificationWithoutSound(userLocation);
  //       break;
  //   }
  //   return Future.value(true);
  // });
}
