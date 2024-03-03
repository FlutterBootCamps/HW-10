
import 'package:amc_applicaition/constant/colors.dart';
import 'package:flutter/material.dart';

class OutLineButton extends StatelessWidget {
   OutLineButton({
    super.key,
    required this.title
  });
  String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(color: whiteColor)),
      ),
      child: Text(
        title,
        style: TextStyle(color: whiteColor),
      ),
    );
  }
}
