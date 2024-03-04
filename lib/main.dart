import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_rest_api/pages/home_page.dart';
import 'package:provider_rest_api/data/fetch_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FetchData(),
      child: const MaterialApp(
       
       
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
