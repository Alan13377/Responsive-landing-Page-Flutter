import 'package:flutter/material.dart';
import 'package:web_interface/widgets/bottom_navbar.dart';
import 'package:web_interface/widgets/carousel.dart';
import 'package:web_interface/widgets/destination_heading.dart';
import 'package:web_interface/widgets/explore_drawer.dart';
import 'package:web_interface/widgets/featured_heading.dart';
import 'package:web_interface/widgets/featured_titles.dart';
import 'package:web_interface/widgets/floating_quick_access_bar.dart';
import 'package:web_interface/widgets/responsive.dart';
import 'package:web_interface/widgets/top_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  double scrollPosition = 0;
  double opacity = 0;

  scrollListener() {
    setState(() {
      scrollPosition = scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    opacity = scrollPosition < size.height * 0.40
        ? scrollPosition / size.height * 0.40
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.blueGrey.shade900.withOpacity(opacity),
              elevation: 0,
              title: Text(
                "EXPLORE",
                style: TextStyle(
                    color: Colors.blueGrey.shade100,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3),
              ),
            )
          : PreferredSize(
              preferredSize: Size(size.width, 1000),
              child: TopNavBar(
                size: size,
                opacity: opacity,
              ),
            ),
      drawer: const ExploreDrawer(),
      body: SingleChildScrollView(
        controller: scrollController,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height * 0.45,
                  width: size.width,
                  child: Image.asset(
                    "assets/cover.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    FloatingQuickAccessBar(
                      size: size,
                    ),
                    Column(
                      children: [
                        FeaturedHeading(size: size),
                        FeaturesTitles(size: size),
                      ],
                    )
                  ],
                )
              ],
            ),
            DestinationHeading(size: size),
            const DestinationCarousel(),
            SizedBox(height: size.height / 10),
            CustomBottomNavBar(),
          ],
        ),
      ),
    );
  }
}
