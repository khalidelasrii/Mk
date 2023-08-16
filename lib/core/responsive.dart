import 'package:flutter/material.dart';

class ResponsiveLayote extends StatelessWidget {
  const ResponsiveLayote({
    super.key,
    required this.disktopScafolde,
    required this.moubileSccafolde,
  });

  final Widget moubileSccafolde;
  final Widget disktopScafolde;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return disktopScafolde;
        } else if (constraints.maxWidth <= 600) {
          return moubileSccafolde;
        }
        return SizedBox();
      },
    );
  }
}
