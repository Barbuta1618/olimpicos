import 'dart:async';

import 'package:coolicons/coolicons.dart';
import 'package:flutter/material.dart';
import 'package:olimpicos/utils/constants.dart';
import 'package:provider/provider.dart';

class SearchbarComponent extends StatefulWidget {
  SearchbarComponent({Key? key}) : super(key: key);

  @override
  State<SearchbarComponent> createState() => _SearchbarComponentState();
}

class _SearchbarComponentState extends State<SearchbarComponent> {
  TextEditingController _controller = new TextEditingController();

  Timer searchTimeout = new Timer(Duration.zero, () {});

  _onChangeHandler(value) {
    const duration = Duration(
        milliseconds:
            800); // set the duration that you want call search() after that.
    if (searchTimeout != null) {
      setState(() => searchTimeout.cancel()); // clear timer
    }
    setState(() => searchTimeout = new Timer(duration, () => search(value)));
  }

  search(value) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {});
    // Provider.of<ApiClient>(context, listen: false)
    //     .searchPosts(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    var inputDecoration = const InputDecoration(
        border: InputBorder.none,
        hintText: "Enter searchterm. (eg: title, tag)",
        icon:
            // ? CircularProgressIndicator()
            Icon(Icons.sports_basketball, color: primaryColor));
    var data = MediaQuery.of(context).size;

    Widget createSnipet = Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(90),
        ),
        child: Container(
          child: Center(
              child: InkWell(
                  borderRadius: BorderRadius.circular(25.0),
                  onHover: (value) {},
                  onTap: () {
                    // showDialog(
                    //     context: context, builder: (context) => CreateSnipets());
                  },
                  child: const Center(
                      child: Icon(Icons.search_rounded, color: primaryColor)))),
        ));

    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: primaryColor, width: 1)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width - 700,
              height: 50,
              child: Center(
                  child: TextField(
                controller: _controller,
                onChanged: _onChangeHandler,
                decoration: inputDecoration,
              ))),
          createSnipet,
        ],
      ),
    );
  }
}
