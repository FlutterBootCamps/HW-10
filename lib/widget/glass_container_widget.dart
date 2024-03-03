import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class GlassContainerWidget extends StatelessWidget {
  const GlassContainerWidget(
      {super.key, required this.child, this.isTransprant = false});
  final Widget child;
  final bool isTransprant;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: isTransprant ? 40 : 120,
      color: const Color.fromARGB(164, 21, 21, 21)
          .withOpacity(isTransprant ? .65 : .77),
      borderRadius: BorderRadius.zero,
      shadowColor: Colors.black,
      child: child,
    );
  }
}
