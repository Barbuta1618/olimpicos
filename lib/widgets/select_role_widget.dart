import 'package:flutter/material.dart';
import '../utils/constants.dart';

class SelectableIcon extends StatefulWidget {
  const SelectableIcon(
      {Key? key, required this.setIcon, required this.selectedOption})
      : super(key: key);

  final Function setIcon;
  final String selectedOption;

  @override
  State<SelectableIcon> createState() => _SelectableIconState();
}

class _SelectableIconState extends State<SelectableIcon> {
  List<Map<String, dynamic>> iconList = [
    {
      'path': 'Manager',
      'isSelected': false,
    },
    {
      'path': 'Trainer',
      'isSelected': false,
    },
    {
      'path': 'Trainee',
      'isSelected': false,
    },
  ];

  @override
  void initState() {
    super.initState();

    if (widget.selectedOption != null) {
      for (var item in iconList) {
        if (item['path'] == widget.selectedOption) {
          item['isSelected'] = true;
        }
      }
    } else {
      iconList[0]['isSelected'] = true;
    }
    for (var item in iconList) {
      if (item['isSelected']) {
        widget.setIcon(item['path']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 15,
        children: [
          ...iconList
              .map((e) => WidgetIcon(
                    path: e['path'],
                    isSelected: e['isSelected'],
                    onTap: () {
                      setState(() {
                        for (var item in iconList) {
                          if (item['isSelected']) {
                            item['isSelected'] = false;
                          }
                        }
                        e['isSelected'] = true;
                        widget.setIcon(e['path']);
                      });
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }
}

class WidgetIcon extends StatelessWidget {
  const WidgetIcon({
    Key? key,
    required this.path,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String path;
  final bool isSelected;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final double widgetWitdh = ((400 - 40) / 5) - (60 / 5);

    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: widgetWitdh,
        height: widgetWitdh,
        decoration: BoxDecoration(
          border: Border.all(
            color: (isSelected ? primaryColor : Colors.grey[400])!,
            width: 1.3,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        padding: const EdgeInsets.all(8),
        // child: Image(
        //   image: AssetImage('assets/images/$path'),
        // ),
        child: Column(
          children: [Icon(Icons.person_2_outlined), Text(path)],
        ),
      ),
    );
  }
}
