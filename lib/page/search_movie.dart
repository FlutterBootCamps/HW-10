import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hw11/api/fetch_data.dart';
import 'package:hw11/helper/screen_helper.dart';

class MoviePage extends StatefulWidget {
  MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final Networking networking = Networking();
  late List movieList = [];
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(actions: [IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_forward_ios_rounded))],
        title: Text("Movie search"),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  SizedBox(
                    width: context.getWidth() * 0.7,
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                          helperText: "name of the movie",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          fillColor: Color.fromARGB(196, 102, 170, 221),
                          filled: true),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        var resultSearch =
                            await networking.getMovie(name: name.text);
                        movieList = resultSearch;
                        setState(() {});
                      },
                      child: const Text("search")),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Image.network(
                        movieList[index]["#IMG_POSTER"],
                        height: 90,
                        width: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movieList[index]["#TITLE"],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                              Text(movieList[index]["#YEAR"].toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600))
                            ]),
                      )
                    ],
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
