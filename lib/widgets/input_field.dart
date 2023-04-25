import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import '../constants.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    Key? key,
    this.prefixIcon,
    this.labelText,
    this.controller,
    this.err,
    this.titleText,
    this.textFieldDimension,
    this.onTap,
    this.readOnly,
    this.titleColor = Colors.black,
    this.hintText,
    this.onChange,
    this.titleFontSize = 20,
  }) : super(key: key);

  final IconData? prefixIcon;
  final String? labelText;
  final String? titleText;
  final Color? titleColor;
  final double? textFieldDimension;
  final TextEditingController? controller;
  final Function? onTap;
  final bool? readOnly;
  final String? err;
  final String? hintText;
  final Function? onChange;

  final double titleFontSize;

  @override
  State<CustomInputField> createState() => _FAInputFieldState();
}

class _FAInputFieldState extends State<CustomInputField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText != null && widget.titleText != '')
          Container(
            margin: const EdgeInsets.only(left: 0.5, bottom: 8),
            child: Row(
              children: [
                Text(
                  widget.titleText ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: widget.titleFontSize,
                    color: widget.titleColor,
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          // height: widget.textFieldDimension,
          child: TextField(
            onChanged: (_) {
              if (widget.onChange != null) {
                widget.onChange!();
              }
            },
            keyboardType: TextInputType.text,
            autocorrect: false,
            enableSuggestions: false,
            readOnly: widget.readOnly == null ? false : true,
            onTap: () {
              try {
                widget.onTap!();
              } catch (e) {
                print(e.toString());
              }
            },
            controller: widget.controller,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
            cursorColor: Colors.blue,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: widget.hintText ?? '',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.w400,
              ),
              focusColor: Colors.grey,
              // labelText: widget.labelText,
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  width: 2,
                  color: widget.err != null ? Colors.red : Colors.grey,
                ),
              ),
              contentPadding: const EdgeInsets.only(top: 30, left: 15),
              prefixIconConstraints: const BoxConstraints(maxWidth: 50),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  width: 2,
                  color: widget.err != null ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ),
        ),
        if (widget.err != null)
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: Text(
              widget.err ?? '',
              style: const TextStyle(color: Colors.red, fontSize: 10),
            ),
          ),
      ],
    );
  }
}
