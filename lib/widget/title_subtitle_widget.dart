import 'package:amc_applicaition/constant/colors.dart';
import 'package:flutter/material.dart';

class titleSubtitleWidget extends StatelessWidget {
  const titleSubtitleWidget(
      {super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(subtitle, style: const TextStyle(fontSize: 16))
      ],
    );
  }
}
