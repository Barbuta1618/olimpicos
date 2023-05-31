import 'package:flutter/material.dart';

import '../utils/constants.dart';

class InputField extends StatelessWidget {
  final TextEditingController inputController;
  final TextInputType textInputType;
  final String? hint;
  final Icon? icon;
  final String? label;
  final int? maxLength;
  final bool isRequired;
  final bool isEnabled;
  final double size;

  final String description;

  final double contentPaddingVertical;
  final double contentPaddingHorizontal;

  final Function onChangeFunction;
  final Function validatorFunction;

  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;

  final Widget? suffixIcon;

  const InputField({
    Key? key,
    required this.inputController,
    required this.textInputType,
    this.label,
    this.icon,
    this.hint,
    this.maxLength,
    this.isRequired = false,
    this.isEnabled = true,
    required this.onChangeFunction,
    required this.validatorFunction,
    this.size = 14,
    this.description = '',
    this.contentPaddingVertical = 15,
    this.contentPaddingHorizontal = 20,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const accentColor = primaryColor;
    const backgroundColor = Colors.white;
    const errorColor = Color(0xffEF4444);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  !isRequired
                      ? Text(
                          label!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        )
                      : Text.rich(
                          TextSpan(
                            text: label!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            children: const [
                              TextSpan(
                                text: ' *',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
              if (description != '') const SizedBox(height: 3),
              if (description != '')
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: secondaryColor,
                  ),
                ),
              const SizedBox(height: 12),
            ],
          ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1),
              ),
            ],
          ),
          child: TextFormField(
            maxLength: maxLength,
            enabled: isEnabled,
            controller: inputController,
            onChanged: (value) {
              onChangeFunction(value);
            },
            keyboardType: textInputType,
            style: TextStyle(
              fontSize: size,
              color: isEnabled ? Colors.black : primaryColor.withOpacity(0.75),
            ),
            maxLines: obscureText ? 1 : null,
            cursorColor: primaryColor,
            validator: (value) {
              return validatorFunction(value);
            },
            obscureText: obscureText,
            enableSuggestions: enableSuggestions,
            autocorrect: autocorrect,
            decoration: InputDecoration(
              prefixIcon: icon,
              hoverColor: Colors.transparent,
              counterStyle: const TextStyle(color: primaryColor),
              filled: true,
              fillColor: isEnabled ? backgroundColor : Colors.grey[100],
              hintText: hint ?? '',
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
              errorStyle: const TextStyle(color: errorColor),
              contentPadding: EdgeInsets.symmetric(
                vertical: contentPaddingVertical,
                horizontal: contentPaddingHorizontal,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: accentColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InfoButton extends StatelessWidget {
  const InfoButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Tooltip(
        richMessage: WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            constraints: const BoxConstraints(maxWidth: 250),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        waitDuration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: const Icon(
          Icons.info_outline_rounded,
          size: 20,
          color: secondaryColor,
        ),
      ),
    );
  }
}
