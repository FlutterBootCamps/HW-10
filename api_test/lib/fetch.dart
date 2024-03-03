import 'dart:math';
import 'package:http/http.dart' as http;

class ImageFetcher {
  static Future<String> fetchRandomImage() async {
    final random = Random();
    final response = await http.get(
      Uri.parse('https://source.unsplash.com/random?${random.nextInt(100)}'),
    );

    if (response.statusCode == 200) {
      return response.request!.url.toString();
    } else {
      throw Exception('Failed to load image');
    }
  }
}
