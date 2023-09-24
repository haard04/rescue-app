import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rescue/agencyHome.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rescue/models/Agency.dart';
import './API/APIService.dart';



class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
  @override
void initState() {
    super.initState();
    initLocationService();
  }




  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  String selectedCategory = 'Fire and Emergency Services'; // Default category
  final TextEditingController customCategoryController =
      TextEditingController();
  final TextEditingController resourceController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  List<String> selectedOptions = [];
  List<String> resourceList=[];

  double latitude=0;
  double longitude=0;
  String city='';
  String state='';


  List<String> categories = [
    'Fire and Emergency Services',
    'Ambulance Services',
    'Law Enforcement Agencies (Police)',
    'Other',
  ];

  bool isNameValid = true;
  bool isContactNumberValid = true;
  bool isAddressValid = true;
   bool showOtherTextField = false;
  bool isCategoryValid = true;
  bool isUIDValid = true;
  bool isPasswordValid = true;

  void validateFields() {
    setState(() {
      isNameValid = nameController.text.isNotEmpty;
      isContactNumberValid = contactNumberController.text.isNotEmpty &&
          contactNumberController.text.length == 10;
      isAddressValid = addressController.text.isNotEmpty;
      
      bool isOtherSelected = selectedCategory == 'Other';
      isCategoryValid =
          isOtherSelected ? customCategoryController.text.isNotEmpty : true;
      
      isPasswordValid = passwordController.text.isNotEmpty;
    });
  }

  Future<void> signUp() async {

    final agencyService = AgencyService();
  //  validateFields();

    // if (isNameValid &&
    //     isContactNumberValid &&
    //     isAddressValid &&
    //     isCategoryValid &&
        
    //     isPasswordValid) {
      // Implement signup logic here
        await getUserLocation();
        String resources = resourceController.text;
        resourceList=resources.split(',');
        print(resourceList);


      Agency agency = Agency(name: nameController.text, address: addressController.text, categories: selectedOptions, resources: resourceList, latitude:latitude , longitude: longitude, city: city, contactNumber: contactNumberController.text, state: state,uid: DateTime.now().millisecondsSinceEpoch,availability: true);

      print(agency.toJson());

        try{
          agencyService.postAgency(agency);
            
            
            
        }
        catch(err){
          showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Your request has failed.'),
          );});
        }
        return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text(
                'Your request has been sent to the admin successfully.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  // Clear form fields
                  nameController.clear();
                  contactNumberController.clear();
                  addressController.clear();
                  cityController.clear();
                  selectedCategory =
                      'Fire and Emergency Services'; // Reset to default category
                  customCategoryController.clear();
                  resourceController.clear();
                  passwordController.clear();

                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
  



  void initLocationService() async {
    LocationPermission permission = await geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Handle the case where the user does not grant location permissions.
      return;
    }
  }
  Future<void> getUserLocation() async {
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
      state = (placemarks[0].administrativeArea).toString();
      print(placemarks[0].country);
      print(placemarks[0].postalCode);



    } catch (e) {
      // Handle errors, such as when the user denies location permission.
      print("Error getting location: $e");
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        
      ),
      body: Container(
        
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name*',
                  errorText: isNameValid ? null : 'Name is required',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff000000)),
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18, // Text font size
                  color: Colors.black,
                  // Text color
                ),
                cursorColor: Color(0xff000000),
              ),
              TextField(
                controller: contactNumberController,
                decoration: InputDecoration(
                  labelText: 'Contact Number*',
                  errorText: isContactNumberValid
                      ? null
                      : 'Contact number is required and must be 10 digits',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff000000)),
                  ),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: const TextStyle(
                  fontSize: 18, // Text font size
                  color: Colors.black, // Text color
                ),
                cursorColor: Color(0xff000000),
              ),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address*',
                  errorText: isAddressValid ? null : 'Address is required',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff000000)),
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18, // Text font size
                  color: Colors.black, // Text color
                ),
                cursorColor: Color(0xff000000),
              ),
              
             Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Category*',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              // Use a ListView.builder to create checkboxes for categories
              ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CheckboxListTile(
                    title: Text(category),
                    value: selectedOptions.contains(category),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) {
                          if (value) {
                            selectedOptions.add(category);
                            
                          }
                        }
                      });
                    },
                  );
                },
              ),
              // Conditionally show the "Other" text field
             
                TextField(
                controller: resourceController,
                decoration: InputDecoration(
                  labelText: 'Resources(Separated by commas)*',
                  errorText: isNameValid ? null : 'Resources is required',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff000000)),
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                cursorColor: Color(0xff000000),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password*',
                  errorText: isPasswordValid ? null : 'Password is required',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff000000)),
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18, // Text font size
                  color: Colors.black, // Text color
                ),
                cursorColor: Color(0xff000000),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // getUserLocation();
                  signUp(); // Pass context to signUp function
                },
                child: const Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffd54339),
                  minimumSize: const Size(100, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
