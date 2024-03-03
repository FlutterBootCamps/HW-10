import 'dart:convert';

import 'package:http/http.dart' as http; 

class Networking {
  final String url = "https://api.spoonacular.com/food/menuItems/";
  final apiKey = "?apiKey=2737b427521b41b78bcc86775408c0d4";
  // final id = 424571;

  Future<Map<String,dynamic>> fetchDataAPI({ required int id}) async{
    final urlAPI = Uri.parse("$url$id$apiKey");
    final res = await http.get(urlAPI);

    if(res.statusCode == 200){
      return json.decode(res.body);
    } else {
      throw const FormatException("can't found data from API",);
    }
  }

}