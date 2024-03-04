import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  final String link = "https://api.thecatapi.com/v1/images/search?limit=5";

  Future<List<Map<String, dynamic>>> getData() async {
    final http.Response response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      return List.from(json.decode(response.body));
    } else {
      throw const FormatException("no data from api");
    }
  }
}
