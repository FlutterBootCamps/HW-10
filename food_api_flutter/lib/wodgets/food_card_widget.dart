import 'package:flutter/material.dart';
import 'package:food_api_flutter/constant/color.dart';
import 'package:food_api_flutter/constant/space.dart';
import 'package:food_api_flutter/helper/helper_screen.dart';

class FoodCard extends StatelessWidget {
  FoodCard({super.key, required this.item});
  Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.getWidth() * 0.60,
        height: context.getHeight() * 0.40,
        child: Stack(
          children: [
            SizedBox(
              width: context.getWidth() * 0.55,
              height: context.getHeight() * 0.40,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  alignment: Alignment.center,
                  width: context.getWidth() * 0.5,
                  height: context.getWidth() * 0.5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: yellow,
                  ),
                  child: Text(
                    item["title"] ?? '',
                    style: const TextStyle(
                        color: black, fontSize: 22, fontWeight: FontWeight.w600),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 60,
              left: 40,
              top: 10,
              child: CircleAvatar(
                backgroundColor: grey,
                backgroundImage: NetworkImage(item['image'] ?? "",
                   ), 
                radius: 60,
                // child:
              ),
            ),
            Positioned(
              bottom: 90,
              left: 15,
              right: 18,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    "asset/carb_icon.png",
                    width: context.getWidth() * 0.05,
                  ),
                  Text(
                    item["nutrition"]["carbs"],
                    style: const TextStyle(
                        color: white, fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  width12,
                  Image.asset("asset/fat_icon.png",
                      width: context.getWidth() * 0.06),
                  Text(
                    item["nutrition"]["fat"],
                    style: const TextStyle(
                        color: white, fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  width12,
                  Image.asset("asset/protein_icon.png",
                      width: context.getWidth() * 0.06),
                  Text(
                    item["nutrition"]["protein"],
                    style: const TextStyle(
                        color: white, fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
