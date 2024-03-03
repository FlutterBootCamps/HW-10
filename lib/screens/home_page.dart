import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hw_10/repository/data_fetcher.dart';
import 'package:hw_10/utils/colors.dart';
import 'package:hw_10/widgets/character_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> data = {};
  String textError = "";
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: starYellow,
        title: const Text(
          "Amiibo Finder",
          style: TextStyle(
              color: blackColor, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: (data.isNotEmpty)
                ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .6,
                  child: ListView(
                        children: List.generate(data["amiibo"].length, (index) {
                          return CharacterContainer(
                          image: data["amiibo"][index]["image"],
                          name: data["amiibo"][index]["name"],
                          game: data["amiibo"][index]["gameSeries"],
                        );
                        }),
                    ),
                )
                : const Center(
                    child: Text(
                    "Search for an Amiibo",
                    style: TextStyle(color: greyColor),
                  )),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: greenColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextField(
                decoration: InputDecoration(
                    fillColor: whiteColor,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ))),
                style: TextStyle(color: blackColor)),
            MaterialButton(
                textColor: whiteColor,
                color: starYellow,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () async {
                  data.clear();
                  try {
                    final networking = Networking();
                    data = await networking.fetchAmiiboData(
                        searchCriteria: searchController.text);
                  } on http.ClientException catch (e) {
                    throw SocketException('Failed host lookup: ${e.message}');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: redColor,
                      content: Text(
                        "Search Criteria not found, please try again",
                        style: TextStyle(color: whiteColor),
                      ),
                    ));
                    print(e);
                  }
                  setState(() {});
                },
                child: const Text("Search"))
          ],
        ),
      ),
    );
  }
}
