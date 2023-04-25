import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../controllers/api_client.dart';
import '../widgets/input_field.dart';
import 'package:routemaster/routemaster.dart';
import '../utils/constants.dart';
import '../widgets/lottie_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController organizationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 700),
        child: Row(
          children: [
            SizedBox(
              width: 200,
              height: 400,
              child: FALottieWidget(
                lottieAsset: 'lotties/balls.json',
                lottieHeight: 200,
              ),
            ),
            SizedBox(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Expanded(
                  //     child: Image.asset(
                  //   'assets/images/login.jpeg',
                  //   fit: BoxFit.cover,
                  // )),
                  Expanded(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 21),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Welcome back',
                            style: GoogleFonts.inter(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Login to your account',
                            style: GoogleFonts.inter(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 35),
                          // const SizedBox(height: 35),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: CustomInputField(
                              titleText: "Username",
                              controller: usernameController,
                              textFieldDimension: 40,
                              titleFontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: CustomInputField(
                              titleText: "Password",
                              controller: passwordController,
                              textFieldDimension: 40,
                              titleFontSize: 18,
                            ),
                          ),
                          // const SizedBox(height: 20),
                          const SizedBox(height: 30),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 98, 15, 252),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                String username = usernameController.text;
                                String password = passwordController.text;
                                String organization =
                                    organizationController.text;
                                // print(username);
                                // print(password);
                                bool resp = await Provider.of<ApiClient>(
                                        context,
                                        listen: false)
                                    .auth(username, password);

                                if (!resp) {
                                  Routemaster.of(context).replace(profilePath);
                                }
                              },
                              child: Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: const Text("Login"))),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
