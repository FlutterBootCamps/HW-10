/*
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:api_test/fetch_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          if (textError.isNotEmpty) Text(textError),
          if (data.isNotEmpty)
            Column(
              children: [
                ...List.generate(data.length, (index) => Image.network(data[index]["url"]))
              ],
            ),
          ElevatedButton(
            onPressed: () async {
              try {
                final networking = Networking();
                data = await networking.fetchDataApi(limit: 9);
              } on FormatException catch (error) {
                print("error");
                textError = error.message;
              } on SocketException catch (error) {
                print(error);
                textError = error.message;
              } catch (error) {
                textError = error.toString();
              }
              setState(() {});
            },
            child: const Text("get data"),
          )
        ],
      ),
    );
  }
}
*/
