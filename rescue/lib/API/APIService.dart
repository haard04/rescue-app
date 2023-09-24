import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rescue/models/Agency.dart';

class AgencyService {
  

  Future<bool> postAgency(Agency agencyData) async {
    final headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

    final baseUrl = 'https://rescue.onrender.com/';
    final response = await http.post(
      Uri.parse(baseUrl),

      
      
      body: jsonEncode(
      {
      "name": " fire station",
      "address": "Address for Gandhinagar Fire and Emergency Services",
      "categories": ["Fire and Emergency Services"],
      "resources": ["Fire Trucks", "Ambulances", "Rescue Equipment"],
      "latitude": 23.222222,
      "longitude": 72.638889,
      "city": "Gandhinagar",
      "contactNumber": "Contact Number for Gandhinagar Fire and Emergency Services",
      "state": "State for Gandhinagar Fire and Emergency Services",
       "uid": 1221,
      "availability": true,
      "password": "1234",
      "verified":true
      }
    ));
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      
      return true;

    } else {
      print(response.statusCode);
      // throw Exception('Failed to post agency data');
      return false;
    }
  }
}


Future<List<Agency>> getAgenciesbyCity(String cityName) async {
  final baseUrl = 'https://rescue.onrender.com'; // Replace with your backend URL
  final response = await http.get(Uri.parse('$baseUrl/bycity?city=$cityName'));
  print('$baseUrl/bycity?city=$cityName');
  print(response.statusCode);
  print(response.body);
  print(response.request);
  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    final List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((json) => Agency.fromJson(json)).toList();
  } else {
    // If the server did not return a 200 OK response, throw an exception
    throw Exception('Failed to load agencies by city');
  }
}