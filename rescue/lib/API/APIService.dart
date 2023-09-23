import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rescue/models/Agency.dart';

class AgencyService {
  final String baseUrl; 

  AgencyService(this.baseUrl);

  Future<Map<String, dynamic>> postAgency(Map<String, dynamic> agencyData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/agency'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(agencyData),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to post agency data');
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