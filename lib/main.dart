import 'package:flutter/material.dart';
import 'package:flutter_geofence/geofence.dart';
import 'package:samplegeo/geo_view/geo_view.dart';

import 'geo_fance_core/geo_fance_core.dart';
import 'geofance/geofance_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Geofence.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: GeoView(),
    );
  }
}
