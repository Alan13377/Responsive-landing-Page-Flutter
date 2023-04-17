import 'package:flutter/material.dart';
import 'package:web_interface/widgets/responsive.dart';

class FeaturesTitles extends StatelessWidget {
  final Size size;
  final List<String> title = ['Trekking', 'Animals', 'Photography'];
  final List<String> assets = [
    'assets/trekking.jpg',
    'assets/animals.jpg',
    'assets/photography.jpeg',
  ];
  FeaturesTitles({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(top: size.height / 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width / 15,
                ),
                SizedBox(
                  width: size.width * .85,
                  height: size.height * 0.4,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: assets.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * .35,
                                  width: size.width / 1.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      assets[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                      top: size.height / 70,
                                    ),
                                    child: Text(
                                      title[index],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: size.width / 15,
                            )
                          ],
                        );
                      }),
                )
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.06,
              left: size.width / 15,
              right: size.width / 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...Iterable<int>.generate(assets.length).map(
                  (int pageIndex) => Column(
                    children: [
                      SizedBox(
                        height: size.width / 6,
                        width: size.width / 3.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            assets[pageIndex],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height / 70,
                        ),
                        child: Text(
                          title[pageIndex],
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
