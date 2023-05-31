import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'menu_bar_widget.dart';

class CustomVerticalAppBar extends StatelessWidget {
  const CustomVerticalAppBar({
    Key? key,
    required this.width,
    required this.changePageNumber,
    required this.number,
    required this.menus,
  }) : super(key: key);

  // final User user;
  final double width;
  final Function changePageNumber;
  final int number;
  final List<dynamic> menus;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MenuWidgetAppBar(
            number: number,
            changePageNumber: changePageNumber,
            menus: menus,
          ),
        ],
      ),
    );
  }
}
