import 'package:flutter/material.dart';
import 'package:map_live_tracker/google_map_page.dart';
import 'package:map_live_tracker/provider/location_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
          child: const GoogleMapPage(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: GoogleMapPage(),
      ),
    );
  }
}
