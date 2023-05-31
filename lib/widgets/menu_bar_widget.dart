import 'package:flutter/material.dart';
import 'package:olimpicos/utils/constants.dart';

class MenuWidgetAppBar extends StatefulWidget {
  const MenuWidgetAppBar({
    Key? key,
    required this.changePageNumber,
    required this.number,
    required this.menus,
  }) : super(key: key);

  final Function changePageNumber;
  final int number;
  final List<dynamic> menus;

  @override
  State<MenuWidgetAppBar> createState() => _MenuWidgetAppBarState();
}

class _MenuWidgetAppBarState extends State<MenuWidgetAppBar> {
  @override
  Widget build(BuildContext context) {
    int activeNumber = widget.number;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...widget.menus.map((e) {
          bool isActive = e['number'] == activeNumber;
          return MenuTileWidgetAppBar(
            title: e['title'],
            icon: e['icon'],
            number: e['number'],
            isActive: isActive,
            changePageNumber: widget.changePageNumber,
          );
        }).toList(),
      ],
    );
  }
}

class MenuTileWidgetAppBar extends StatefulWidget {
  const MenuTileWidgetAppBar({
    Key? key,
    required this.isActive,
    required this.title,
    required this.icon,
    required this.changePageNumber,
    required this.number,
  }) : super(key: key);

  final bool isActive;
  final String title;
  final IconData icon;
  final int number;
  final Function changePageNumber;

  @override
  State<MenuTileWidgetAppBar> createState() => _MenuTileWidgetAppBarState();
}

class _MenuTileWidgetAppBarState extends State<MenuTileWidgetAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          widget.changePageNumber(widget.number);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
          decoration: BoxDecoration(
            color: widget.isActive
                // ? kPrimaryColor.withOpacity(0.1)
                ? Colors.white
                : Colors.transparent,
            // borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: widget.isActive ? primaryColor : secondaryColor,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 15,
                    color: widget.isActive ? primaryColor : secondaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // Expanded(
              //   child: Html(
              //     data: widget.title,
              //     style: {
              //       "body": Style(
              //         fontSize: const FontSize(15),
              //         fontWeight: FontWeight.w900,
              //         color:
              //             widget.isActive ? kPrimaryColor : kSecondaryTextColor,
              //       ),
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
