import 'package:api_test/fetch.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _imageUrl = '';
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    fetchImage();
  }

  Future<void> fetchImage() async {
    setState(() {
      _loading = true;
    });

    try {
      final imageUrl = await ImageFetcher.fetchRandomImage();
      setState(() {
        _imageUrl = imageUrl;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
      // Handle error
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Image Viewer'),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    _imageUrl,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: fetchImage,
                    child: Text('Load Another Image'),
                  ),
                ],
              ),
            ),
    );
  }
}
