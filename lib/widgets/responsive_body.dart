import 'package:flutter/material.dart';

class ResponsiveBody extends StatelessWidget {
  final Widget leftColumn;
  final Widget centerColumn;
  final Widget rightColumn;

  const ResponsiveBody({
    super.key,
    required this.leftColumn,
    required this.centerColumn,
    required this.rightColumn,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 1000) {
      // Versión web: tres columnas
      return Row(
        children: [
          Expanded(flex: 1, child: leftColumn),
          Expanded(flex: 2, child: centerColumn),
          Expanded(flex: 1, child: rightColumn),
        ],
      );
    } else if (screenWidth > 600) {
      // Versión tablet: dos columnas
      return Row(
        children: [
          Expanded(flex: 3, child: centerColumn),
          Expanded(flex: 1, child: rightColumn),
        ],
      );
    } else {
      // Versión móvil: solo columna central
      return centerColumn;
    }
  }
}
