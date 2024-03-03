import 'package:amc_applicaition/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

class RowAppBar extends StatelessWidget {
  RowAppBar({super.key, required this.pageName});
  String pageName;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        pageName,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      const Spacer(),
      IconButton(
          onPressed: () {},
          icon: Iconify(
            '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><g fill="#b51a00" fill-rule="evenodd" clip-rule="evenodd"><path d="M16 9a4 4 0 1 1-8 0a4 4 0 0 1 8 0m-2 0a2 2 0 1 1-4 0a2 2 0 0 1 4 0"/><path d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11s11-4.925 11-11S18.075 1 12 1M3 12c0 2.09.713 4.014 1.908 5.542A8.986 8.986 0 0 1 12.065 14a8.984 8.984 0 0 1 7.092 3.458A9 9 0 1 0 3 12m9 9a8.963 8.963 0 0 1-5.672-2.012A6.992 6.992 0 0 1 12.065 16a6.991 6.991 0 0 1 5.689 2.92A8.964 8.964 0 0 1 12 21"/></g></svg>',
            size: 30,
            color: whiteColor,
          ))
    ]);
  }
}
