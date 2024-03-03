import 'package:amc_applicaition/constant/colors.dart';
import 'package:amc_applicaition/models/cinemas_model.dart';
import 'package:amc_applicaition/widget/outline_button.dart';
import 'package:flutter/material.dart';

class OurCinemasRow extends StatefulWidget {
  const OurCinemasRow({super.key, required this.locationData});

  final LocationData locationData;

  @override
  State<OurCinemasRow> createState() => _OurCinemasRowState();
}

class _OurCinemasRowState extends State<OurCinemasRow> {
  final bool _isFilled = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 50,
            ),
            // IconButton(
            //     onPressed: () {
            //       _isFilled = !_isFilled;
            //       setState(() {});
            //     },
            //     icon: Icon(
            //       _isFilled ? Icons.star_border : Icons.star_outlined,
            //
            //       size: 40,
            //     )),
            // const SizedBox(
            //   width: 20,
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.locationData.location!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 20),
                ),
                Text(widget.locationData.km!,
                    style: TextStyle(color: whiteColor)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Text(
                      "${widget.locationData.makan!} , ${widget.locationData.city!}",
                      style: TextStyle(color: whiteColor)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    OutLineButton(
                      title: "Directions",
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          
                        },
                        child: Text(
                          "Showtimes",
                          style: TextStyle(color: blackColor),
                        ))
                  ],
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Divider(
            thickness: 1,
          ),
        )
      ],
    );
  }
}
