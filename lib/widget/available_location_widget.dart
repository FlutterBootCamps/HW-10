import 'package:amc_applicaition/constant/colors.dart';
import 'package:amc_applicaition/models/cinemas_model.dart';
import 'package:amc_applicaition/pages/details_movie_page.dart';
import 'package:amc_applicaition/widget/time_available_widget.dart';
import 'package:flutter/material.dart';

class AvailableLocationWidget extends StatelessWidget {
  const AvailableLocationWidget({super.key, required this.locationData});
  final LocationData locationData;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text(
        locationData.location!,
        style: TextStyle(fontWeight: FontWeight.bold, color: whiteColor),
      ),
      collapsedIconColor: whiteColor,
      iconColor: whiteColor,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Standard",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Reserves Seating AMC Luxe Recliners AMC Plush Rockers",
              style: TextStyle(color: greyColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const Wrap(
              children: [
                TimeAvailable(
                  time: "05:00 am",
                ),
                TimeAvailable(
                  time: "08:00 pm",
                ),
                TimeAvailable(
                  time: "11:30 pm",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        )
      ],
    );
  }
}
