import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final Color dotColor;
  final double dotSize;
  final double spacing;
  final int? dotCount;

  DottedDivider({
    this.dotColor = Colors.black,
    this.dotSize = 6.0,
    this.spacing = 8.0,
    this.dotCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(dotCount!, (index) {
            return Container(
              width: dotSize,
              height: dotSize,
              margin: EdgeInsets.symmetric(horizontal: spacing / 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dotColor,
              ),
            );
          }),
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
