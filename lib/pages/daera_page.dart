import 'package:amc_applicaition/constant/colors.dart';
import 'package:amc_applicaition/widget/appbar_row.dart';
import 'package:flutter/material.dart';

class DaeraPage extends StatelessWidget {
  const DaeraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: Scaffold(
        backgroundColor: blackColor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/images/daera.png'),
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Join AMC Darea",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "The First Loyalty Program for Cinemas in KSA",
                style: TextStyle(color: whiteColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: blackColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: whiteColor))),
                      onPressed: () {},
                      child: const Text(
                        "Sign in",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  ElevatedButton(
                      onPressed: () {
                     
                      },
                      child: Text(
                        "Join Now Get Rewards",
                        style: TextStyle(
                            color: blackColor, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
