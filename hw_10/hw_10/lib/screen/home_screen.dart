import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hw_10/constant/colors.dart';
import 'package:hw_10/extensions/screen_handler.dart';
import 'package:hw_10/repository/fetch_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController numberController = TextEditingController();
  List data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue.withOpacity(0.4),
      appBar: AppBar(
        backgroundColor: lightBlue,
        centerTitle: true,
        title: Text(
          "shibe.online",
          style: TextStyle(
              color: textColor, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.getHeight() * 0.50,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Wrap(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: context.getHeight() * 0.20,
                        width: context.getWidth(),
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            border: Border.all(
                              color: lightBlue,
                              width: 3,
                              style: BorderStyle.solid,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        alignment: Alignment.center,
                        child: Image.network(
                          data[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        height: 350,
        decoration: BoxDecoration(
            color: lightBlue,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            Text(
              "Enter image Count",
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),SizedBox(height: 8,),
            TextField(
              keyboardType: TextInputType.number,
              controller: numberController,
              decoration: InputDecoration(
                fillColor: textColor,
                filled: true,
                prefixIcon: const Icon(Icons.numbers),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(width: 2, color: textColor),
                    gapPadding: 20),
                hintText: "Enter Number",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final netWorking = NetWorking();
                  data = await netWorking.getData(
                      index: int.parse(numberController.text));
                } on FormatException catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.message)));
                } on SocketException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("API Concatenation Error: {$e}")));
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
                setState(() {});
              },
              child: Text(
                "Click",
                style: TextStyle(
                    color: lightBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
