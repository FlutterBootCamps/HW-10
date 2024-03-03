import 'package:api_flutter/widgets/dot_divider.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String imageUrl;

  CustomContainer({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.6,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Background image
                Image.network(
                  imageUrl,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 0,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
         DottedDivider(
          dotCount: 2,
        ),
         DottedDivider(
          dotCount: 2,
        ),
         DottedDivider(
          dotCount: 2,
        ),
         DottedDivider(
          dotCount: 2,
        ),
         DottedDivider(
          dotCount: 2,
        ),
         DottedDivider(
          dotCount: 2,
        ),
        DottedDivider(
          dotCount: 2,
        ),
        DottedDivider(
          dotCount: 10,
        ),
         DottedDivider(
          dotCount: 9,
        ),
         DottedDivider(
          dotCount: 8,
        ),
        DottedDivider(
          dotCount: 7,
        ),
         DottedDivider(
          dotCount: 6,
        ),
        DottedDivider(
          dotCount: 5,
        ),
         DottedDivider(
          dotCount: 4,
        ),
        DottedDivider(
          dotCount: 3,
        ),
         DottedDivider(
          dotCount: 2,
        ),
        DottedDivider(
          dotCount: 1,
        ),
      ],
    );
  }
}