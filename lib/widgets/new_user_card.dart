import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/lottie_widget.dart';
import '../utils/constants.dart';

class HelloCard extends StatelessWidget {
  const HelloCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const FALottieWidget(
              lottieAsset: 'lotties/welcome.json',
              lottieHeight: 250,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Welcome to ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    logo(1)
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      'Unlock ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Your Potential',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      ', Embrace the ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Challenge',
                      style: TextStyle(
                        fontSize: 21,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                      // make a border radius for the button
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Enroll Now!',
                          style: TextStyle(fontSize: 18),
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
