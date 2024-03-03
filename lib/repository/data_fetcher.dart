import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking {
  final String url = "https://www.amiiboapi.com/api/amiibo/?name=";

  Future<Map<String, dynamic>> fetchAmiiboData({required String searchCriteria}) async {
    final searchUrl = Uri.parse("$url$searchCriteria");
    final response = await http.get(searchUrl);
    
    if (response.statusCode == 200){
      return json.decode(response.body);
    }else {
      throw const FormatException();
    }
  }
}