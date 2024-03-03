import 'package:flutter/material.dart';
import 'package:food_api_flutter/constant/color.dart';
import 'package:food_api_flutter/constant/space.dart';
import 'package:food_api_flutter/helper/helper_screen.dart';
import 'package:food_api_flutter/repositry/fetch_data.dart';
import 'package:food_api_flutter/wodgets/food_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> data = {};
  String textError = '';
  TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightYellow,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 79, 79, 79),

          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'Food API',
                      style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    height12,
                    TextField(
                      controller: idController,
                      decoration: const InputDecoration(
                          fillColor: white,
                          filled: true,
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                          hintText: "Search Food by ID",
                          hintStyle: TextStyle(color: grey, fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                    ),
                    height12,
                    InkWell(
                      onTap: () async {
                        if(idController.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text ('Please enter a food ID')));
                        }
                        try {
                          final network = Networking();
                          data = await network.fetchDataAPI(
                              id: int.parse(idController.text));
                        } on FormatException catch (error) {
                          textError = error.message;
                        } catch (error) {
                          // to handel any error can across
                          textError = error.toString();
                        }

                        setState(() {});
                      },
                      child: Container(
                        width: context.getWidth() * 0.9,
                        height: context.getWidth() * 0.1,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "Show Food Fact",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: white, fontSize: 22),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    
     body: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          height24,
          height24,
          if (textError.isNotEmpty) Text(textError),
          if (data.isEmpty ) Center(child: 
          Image.asset("asset/cutlery.png", 
          width: context.getWidth()* 0.6,
          opacity: const AlwaysStoppedAnimation(0.7),)),
          if (data.isNotEmpty ) FoodCard(item: data),
        ],
      ),
    );
  }
}
