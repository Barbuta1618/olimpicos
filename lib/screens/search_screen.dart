import 'package:flutter/material.dart';
import 'package:olimpicos/utils/constants.dart';
import '../widgets/search_bar.dart';

class SearchScreen extends StatefulWidget {
  List<String>? params;
  SearchScreen({super.key, this.params});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map> items = [
    {"text": "Clubs", "selected": false},
    {"text": "Trainers", "selected": false},
    {"text": "Athletes", "selected": false},
    {"text": "Training Sessions", "selected": false},
  ];

  void initState() {
    super.initState();
    if (widget.params != null) {
      print(widget.params);
      items.forEach((element) {
        if (widget.params!.contains(element['text'])) {
          element['selected'] = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 200,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SearchbarComponent(),
            Center(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: items.map((e) {
                    return Container(
                      decoration: BoxDecoration(color: Colors.transparent),
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          setState(() {
                            if (e['selected']) {
                              e['selected'] = false;
                            } else {
                              e['selected'] = true;
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 15),
                          decoration: BoxDecoration(
                              color: e['selected']
                                  ? primaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: primaryColor, width: 1)),
                          child: Text(
                            e['text'],
                            style: TextStyle(
                                color:
                                    e['selected'] ? Colors.white : primaryColor,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    );
                  }).toList()),
            ),
          ],
        ));
  }
}
