import 'package:flutter/material.dart';
import 'package:rescue/adminPanel.dart';
import 'package:rescue/agencyHome.dart';
import 'package:rescue/login.dart';
import 'package:rescue/models/Agency.dart';
import 'package:rescue/signup.dart';
import 'package:rescue/userHome.dart';
import 'package:rescue/API/APIService.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
     String city='';
     double latitude=0;
     double longitude=0;




  Future<String> getUserLocation() async {
    try {
      Position userLocation = await geolocator.getCurrentPosition();
      latitude = userLocation.latitude;
      longitude = userLocation.longitude;
      

      // Use latitude and longitude in your emergency signal or message.
      print("Latitude: $latitude, Longitude: $longitude");
      

List<Placemark> placemarks = await placemarkFromCoordinates(
        userLocation.latitude,
        userLocation.longitude,
      );
      print(placemarks[0].subLocality);
      city = placemarks[0].locality.toString();
      // state = (placemarks[0].administrativeArea).toString();
      print(placemarks[0].country);
      print(placemarks[0].postalCode);
      return city;



    } catch (e) {
      // Handle errors, such as when the user denies location permission.
      print("Error getting location: $e");
      throw e;
    }
  }

    Future<List<Agency>> fetchAgencies(String city) async {
  try {
    List<Agency> agencies = await getAgenciesbyCity(city);
    // Do something with the list of agencies
    print(agencies);
    return agencies;
  } catch (e) {
    // Handle errors
    print('Error: $e');
    throw e; // Rethrow the error to propagate it
  }
}


    Future gotoUser() async{
                 

                  List<Agency>agencies;
                  agencies=await fetchAgencies('Gandhinagar');
                  Navigator.push(context,MaterialPageRoute(builder: (context) => userHomePage(agencies ),) );
                }
    
     Future<void> _showPasswordInputDialog(BuildContext context) async {
    String enteredPassword = '';

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Admin Login'),
          content: TextField(
            obscureText: true,
            onChanged: (value) {
              enteredPassword = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter Password',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                // Replace 'your_admin_password' with the actual admin password
                if (enteredPassword == 'admin') {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboardPage(),));// Navigate to admin dashboard
                } else {
                  // Handle incorrect password here, show an error message, etc.
                }
              },
            ),
          ],
        );
      },
    );
  }


    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To LifeLineResQ',
        style: TextStyle(color: Colors.white),),
        backgroundColor:Color(0xffd54339),
      ),
      body: Container(
        
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: gotoUser,
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffd54339), // Set the button color to green
                  minimumSize: Size(220, 70), // Set the button size
                ),
                child: const Text(
                  'User',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white), // Set button text color to white
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => AgencySignInPage(),) );},
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffd54339),
                  minimumSize: Size(220, 70),
                ),
                child: const Text(
                  'Rescue Agency',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                   _showPasswordInputDialog(
                      context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffd54339),
                  minimumSize: Size(220, 70),
                ),
                child: const Text(
                  'Admin Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
