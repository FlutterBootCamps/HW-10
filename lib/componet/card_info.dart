
import 'package:flutter/material.dart';

class RowInfoCard extends StatelessWidget {
  const RowInfoCard({
    super.key,
    required this.cardInfo,
    required this.title,
  });
  final String title;
  final String cardInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Text(
            "$title : ",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            cardInfo,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
