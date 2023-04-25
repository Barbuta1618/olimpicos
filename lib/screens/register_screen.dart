import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olimpicos/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../controllers/api_client.dart';
import '../widgets/input_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Expanded(
          //     child: Image.asset(
          //   'assets/images/login.jpeg',
          //   fit: BoxFit.cover,
          // )),
          SizedBox(
            width: 400,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 21),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Create an acount',
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'What is your role?',
                    style: GoogleFonts.inter(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  RoleSelect(),
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
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 100,
                    height: 80,
                    child: CustomInputField(
                      titleText: "Password",
                      controller: passwordController,
                      textFieldDimension: 40,
                      titleFontSize: 18,
                    ),
                  ),
                  // const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Routemaster.of(context).replace(registerPath);
                        },
                        child: Text(
                          "Register",
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        String username = usernameController.text;
                        String password = passwordController.text;

                        bool resp =
                            await Provider.of<ApiClient>(context, listen: false)
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
    );
  }
}

class RoleSelect extends StatefulWidget {
  const RoleSelect({super.key});

  @override
  State<RoleSelect> createState() => _RoleSelectState();
}

class _RoleSelectState extends State<RoleSelect> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          "Role",
          style: GoogleFonts.inter(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        DropdownButton<String>(
          value: "Admin",
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: GoogleFonts.inter(
            fontSize: 15,
            color: Colors.black,
          ),
          underline: Container(
            height: 2,
            color: primaryColor,
          ),
          onChanged: (String? newValue) {
            setState(() {
              // dropdownValue = newValue;
            });
          },
          items: <String>['Admin', 'User', 'Guest']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
              onTap: () {},
            );
          }).toList(),
        ),
      ],
    );
  }
}
