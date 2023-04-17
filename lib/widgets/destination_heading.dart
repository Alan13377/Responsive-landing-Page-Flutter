import 'package:flutter/material.dart';
import 'package:web_interface/widgets/responsive.dart';

class DestinationHeading extends StatelessWidget {
  final Size size;
  const DestinationHeading({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Container(
            padding: EdgeInsets.only(
              top: size.height / 20,
              bottom: size.height / 20,
            ),
            width: size.width,
            child: const Text(
              "Destinations diversity",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.only(
              top: size.height / 10,
              bottom: size.height / 15,
            ),
            width: size.width,
            child: const Text(
              'Destinations diversity',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
