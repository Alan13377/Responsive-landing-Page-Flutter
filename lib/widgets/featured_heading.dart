import 'package:flutter/material.dart';
import 'package:web_interface/widgets/responsive.dart';

class FeaturedHeading extends StatelessWidget {
  final Size size;
  const FeaturedHeading({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.06,
        left: size.width / 15,
        right: size.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(),
                const Text(
                  "Featured",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Unique wildlife tours & destinations",
                  textAlign: TextAlign.end,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                    child: Text(
                  "Unique wildlife tours & destinations",
                  textAlign: TextAlign.end,
                ))
              ],
            ),
    );
  }
}
