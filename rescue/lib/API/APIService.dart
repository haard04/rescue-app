import 'dart:convert';
import 'package:http/http.dart' as http;

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
