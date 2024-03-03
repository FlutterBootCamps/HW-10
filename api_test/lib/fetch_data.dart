import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;


/*
class Networking {
  final String url = "https://api.thecatapi.com/v1/images/search?";

  Future<List<Map<String, dynamic>>> fetchDataApi({required int limit}) async {
    final urlApi = Uri.parse("${url}limit=$limit");
    final res = await http.get(urlApi);
    if (res.statusCode == 200) {
      return List.from(json.decode(res.body));
    } else {
      throw const FormatException("no data from the  Api");
    }
  }
}
*/