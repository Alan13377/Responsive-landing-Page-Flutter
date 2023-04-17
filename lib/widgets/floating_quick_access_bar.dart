import 'package:flutter/material.dart';
import 'package:web_interface/widgets/custom_text.dart';
import 'package:web_interface/widgets/responsive.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  final Size size;
  const FloatingQuickAccessBar({
    super.key,
    required this.size,
  });

  @override
  State<FloatingQuickAccessBar> createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  List<Widget> rowElements = [];
  List<String> items = ['Destination', 'Dates', 'People', 'Experience'];
  List<IconData> icons = [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny
  ];

  List<Widget> generateRowsElements() {
    rowElements.clear();
    for (var i = 0; i < items.length; i++) {
      Widget elementTile = CustomText(
        title: items[i],
        color: Colors.blueGrey,
        colorHover: Colors.blueGrey[900] as Color,
      );
      Widget spacer = SizedBox(
        height: widget.size.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );

      rowElements.add(elementTile);
      if (i < items.length - 1) {
        rowElements.add(spacer);
      }
    }
    return rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Padding(
        padding: EdgeInsets.only(
            top: widget.size.height * 0.40,
            right: ResponsiveWidget.isSmallScreen(context)
                ? widget.size.width / 12
                : widget.size.width / 5,
            left: ResponsiveWidget.isSmallScreen(context)
                ? widget.size.width / 12
                : widget.size.width / 5),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Column(
                children: [
                  ...Iterable<int>.generate(items.length).map(
                    (pageIndex) => Padding(
                      padding: EdgeInsets.only(top: widget.size.height / 80),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: widget.size.height / 45,
                              bottom: widget.size.height / 45,
                              left: widget.size.width / 20),
                          child: Row(
                            children: [
                              Icon(
                                icons[pageIndex],
                                color: Colors.blueGrey,
                              ),
                              SizedBox(width: widget.size.width / 20),
                              CustomText(
                                  title: items[pageIndex],
                                  color: Colors.black,
                                  colorHover: Colors.blueGrey)
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: widget.size.height / 50,
                    bottom: widget.size.height / 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: generateRowsElements(),
                  ),
                ),
              ),
      ),
    );
  }
}
