import 'package:flutter/material.dart';
import 'package:hw_10/utils/colors.dart';

class CharacterContainer extends StatelessWidget {
  const CharacterContainer({
    super.key, required this.image, required this.name, required this.game,
  });

  final String image;
  final String name;
  final String game;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: tealColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: whiteColor, image: DecorationImage(image: NetworkImage(image))),
            
          ),
          const SizedBox(height: 16,),
          Text("Name: $name", style: const TextStyle(color: whiteColor, fontSize: 24),),
          const SizedBox(height: 16,),
          Flexible(child: Text("Game Series: $game", style: const TextStyle(color: whiteColor, fontSize: 24),)),
        ],
      ),
    );
  }
}
