import 'package:api_flutter/helper/extintion.dart';
import 'package:api_flutter/network.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> image = [];
  String SelectImage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(163, 191, 161, 214),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(194, 187, 155, 212),
        title: const Text("Cat images"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (SelectImage.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    SelectImage,
                    fit: BoxFit.cover,
                    height: context.getHeight() / 1.5,
                    width: context.getWidth(),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      image = await Network().getData();
                      for (var element in image) {
                        await Future.delayed(const Duration(seconds: 2));
                        SelectImage = element["url"];
                        setState(() {});
                      }
                    } on FormatException catch (error) {
                      return AlertDialog(
                            backgroundColor: const Color.fromARGB(159, 0, 0, 0),
                            content: Text(
                              error.message,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          );
                    } catch (error) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: const Color.fromARGB(159, 0, 0, 0),
                            content: Text(
                              error.toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          );
                        },
                      );
                    }

                    setState(() {});
                  },
                  child: const Text("Show Cat images")),
            ],
          ),
        ),
      ),
    );
  }
}
