import 'package:amc_applicaition/constant/colors.dart';
import 'package:amc_applicaition/widget/appbar_row.dart';
import 'package:amc_applicaition/widget/flouat_button.dart';
import 'package:amc_applicaition/widget/outline_button.dart';
import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      floatingActionButton: const FloatingButtonWidget(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowAppBar(
              pageName: "AMC Exclusive Offers",
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset('assets/images/offer.png'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "The Sharing Compo",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Get the sharing Compo for SAR 239"),
            const SizedBox(
              height: 15,
            ),
            OutLineButton(
              title: "Know More",
            ),
          ],
        ),
      )),
    );
  }
}
