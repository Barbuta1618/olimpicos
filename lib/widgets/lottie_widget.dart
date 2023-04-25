import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FALottieWidget extends StatelessWidget {
  const FALottieWidget({
    Key? key,
    required this.lottieAsset,
    required this.lottieHeight,
  }) : super(key: key);

  final String lottieAsset;
  final double lottieHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: lottieHeight,
        height: lottieHeight,
        child: Lottie.asset(lottieAsset),
      ),
    );
  }
}
