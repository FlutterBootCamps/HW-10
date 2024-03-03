import 'package:amc_applicaition/constant/colors.dart';
import 'package:flutter/material.dart';

class FoodWidget extends StatelessWidget {
  FoodWidget(
      {super.key,
      required this.backgroundPath,
      required this.iconImg,
      required this.title,
      required this.description});
  String backgroundPath;
  String iconImg;
  String title;
  String description;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(),
          child: Image.asset(
            backgroundPath,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.9),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  iconImg,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: const TextStyle(height: 1.5),
              )
            ],
          ),
        ),
      ],
    );
  }
}
