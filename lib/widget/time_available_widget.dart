
import 'package:amc_applicaition/constant/colors.dart';
import 'package:flutter/material.dart';

class TimeAvailable extends StatelessWidget {
  const TimeAvailable({super.key, required this.time});
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: whiteColor),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        time,
        style: TextStyle(color: whiteColor),
      ),
    );
  }
}

