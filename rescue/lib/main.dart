import 'package:flutter/material.dart';
import 'package:rescue/choice.dart';
import 'package:geolocator/geolocator.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final locationService = LocationService();
  await locationService.initLocationService();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      
     
      theme: ThemeData(
        
        primaryColor: Colors.red,

        useMaterial3: true,
      ),
      home:  choice(),
    );
  }
  
}



class LocationService {
  Future<void> initLocationService() async {
    final Geolocator geolocator = Geolocator();
    final LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // Handle denied permission
      // You can show a dialog or message to request permission again
    } else if (permission == LocationPermission.deniedForever) {
      // Handle denied permission forever
      // You can show a dialog or message directing users to app settings
    } else {
      // Permission granted, you can proceed with location services
    }
  }
}
