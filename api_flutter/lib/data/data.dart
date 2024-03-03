import 'dart:convert';

import 'package:api_flutter/model/picsum.dart';
import 'package:http/http.dart' as http;

class Networking {
  final String url = "https://picsum.photos/v2/list";
  Future<List<Picsum>> fetchDataApp() async {
    final uriApi = Uri.parse("${url}");
    final response = await http.get(uriApi);
    print(response.statusCode);

    if (response.statusCode == 200) {
         List<dynamic> jsonList = json.decode(response.body);

      List<Picsum> picsumList = jsonList
          .map((json) => Picsum(
                author: json['author'] ?? '',
                url: json['download_url'] ?? '',
              ))
          .toList(); 
          return picsumList;
    } else {
      throw const FormatException("There is Error please try again");
    }
  }
}
