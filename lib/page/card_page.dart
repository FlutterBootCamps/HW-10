import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hw11/api/fetch_data.dart';
import 'package:hw11/componet/card_info.dart';
import 'package:hw11/helper/list_colors.dart';
import 'package:hw11/helper/screen_helper.dart';
import 'package:hw11/page/search_movie.dart';

class CardPage extends StatefulWidget {
  CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final Networking networking = Networking();
  late List cardInfo = [];
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade200,
        appBar: AppBar(actions: [IconButton(onPressed: (){context.pushTo(view: MoviePage());}, icon:Icon(Icons.arrow_forward_ios_rounded))],
          title: Text("random card"),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    BackdropFilter(
                      blendMode: BlendMode.hardLight,
                      filter: ImageFilter.blur(sigmaX: 200.0, sigmaY: 200.0),
                      child: Image.asset(
                        "lib/Rectangle 28.png",
                        fit: BoxFit.fitWidth,
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.9,
                        color: listColor[Random().nextInt(11)],
                      ),
                    ),
                    if (cardInfo.isNotEmpty)
                      Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          cardInfo[7],
                          fit: BoxFit.fitWidth,
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                    if (cardInfo.isNotEmpty)
                      Positioned(
                        top: 0,
                        left: -10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RowInfoCard(
                                title: "name", cardInfo: cardInfo[0] ?? "null"),
                            RowInfoCard(
                                title: "type", cardInfo: cardInfo[1] ?? "null"),
                            RowInfoCard(
                                title: "atk", cardInfo: cardInfo[2].toString()),
                            RowInfoCard(
                                title: "def", cardInfo: cardInfo[3].toString()),
                            RowInfoCard(
                                title: "level",
                                cardInfo: cardInfo[4].toString()),
                            RowInfoCard(
                                title: "race", cardInfo: cardInfo[5] ?? "null"),
                            RowInfoCard(
                                title: "attribute",
                                cardInfo: cardInfo[6] ?? "null"),
                          ],
                        ),
                      )
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    var result = await networking.getCharacters();

                    // Assuming result is a List<Map<String, dynamic>>
                    cardInfo = result;
                    setState(() {});
                  },
                  child: Text("show random card"),
                ),
                SizedBox(
                  height: 20,
                ),
],
            ),
          ),
        ),
      ),
    );
  }
}
