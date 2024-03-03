import 'dart:convert';

import 'package:http/http.dart' as http;

class NetWorking {
  final String url = "http://shibe.online/api/shibes?";

  Future<List> getData({required int index}) async {
    final urlApi = Uri.parse("${url}count=$index");

    final res = await http.get(urlApi);

    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else  {
      throw const FormatException("No Data");
    }
  }
}
