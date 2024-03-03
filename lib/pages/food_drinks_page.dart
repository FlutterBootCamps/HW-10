import 'package:amc_applicaition/constant/colors.dart';
import 'package:amc_applicaition/widget/appbar_row.dart';
import 'package:amc_applicaition/widget/flouat_button.dart';
import 'package:amc_applicaition/widget/food_drinks_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodDrinkPage extends StatelessWidget {
  const FoodDrinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      floatingActionButton:FloatingButtonWidget(), 
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                RowAppBar(pageName: " Food & Drinks"),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset('assets/images/juice.png'),
                            const Positioned(
                              top: 70,
                              child: Column(
                                children: [
                                  Text(
                                    "Food & Drinks at AMC",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "We're always innovating and exploring new ways to\nbring the best food and drinks to our cinemas.",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        FoodWidget(
                          backgroundPath: 'assets/images/popcornred.png',
                          iconImg: 'assets/images/cinemaSoup.png',
                          title: "We're going shopping!",
                          description:
                              "The best part of Cinema Souq is yoy. With an unconventioal open floor plan, you set the pace - whether leisurely shopping or moving with precision,",
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        FoodWidget(
                          backgroundPath: 'assets/images/ice.png',
                          iconImg: 'assets/images/mac.png',
                          title: "Cheers to the Movies",
                          description:
                              "The term macguffin, coined by Alfred Hitchcock, refers to a plot device that propels a movie forward. Our specialty mocktails and coffee drinks will be just the thing to enhance this movie experience into a story worth remembering.",
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        FoodWidget(
                          backgroundPath: 'assets/images/criep.png',
                          iconImg: 'assets/images/sweet.png',
                          title: "Gourmet Greatness",
                          description:
                              "Movies means popcorn and dessert. Handcrafted bubble waffles and crepes with your favorite toppings made fresh just for you, custom pick'n'mix, and decadent cake jars are just some of many dessert choices..",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

