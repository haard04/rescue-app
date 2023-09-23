import 'package:flutter/material.dart';
import 'package:rescue/adminPanel.dart';
import 'package:rescue/agencyHome.dart';
import 'package:rescue/signup.dart';

class choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wellcome To LifeLineResQ'),
        backgroundColor: Color(0xff222222),
      ),
      body: Container(
        color: Color(0xff505050), // Set the background color here
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => AdminSignInPage(),) );
                },
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
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => AdminSignInPage(),) );
                },
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
                  Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpPage(),) );
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
