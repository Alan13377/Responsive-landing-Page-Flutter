import 'package:flutter/material.dart';
import 'package:web_interface/widgets/custom_text.dart';

class TopNavBar extends StatelessWidget {
  final double opacity;
  const TopNavBar({
    super.key,
    required this.size,
    required this.opacity,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade900.withOpacity(opacity),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Text(
              "EXPLORE",
              style: TextStyle(
                color: Colors.blueGrey.shade100,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    title: "Discover",
                    color: Colors.white,
                    colorHover: Colors.blue.shade200,
                  ),
                  SizedBox(
                    width: size.width / 20,
                  ),
                  CustomText(
                    title: "Contact Us",
                    color: Colors.white,
                    colorHover: Colors.blue.shade200,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: const CustomText(
                title: "Sign Up",
                color: Colors.white70,
                colorHover: Colors.white,
              ),
            ),
            SizedBox(
              width: size.width / 50,
            ),
            InkWell(
              onTap: () {},
              child: const CustomText(
                title: "Login",
                color: Colors.white70,
                colorHover: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
