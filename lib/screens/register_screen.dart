import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olimpicos/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'dart:html' as html;

import '../controllers/api_client.dart';
import '../widgets/input_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController clubController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  String role = 'manager';

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
            width: 600,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 21, maxHeight: 1000),
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: SingleChildScrollView(
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
                    const SizedBox(height: 35),
                    SizedBox(
                        height: 50,
                        width: 400,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 120,
                                height: 200,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        role == 'manager'
                                            ? primaryColor
                                            : primaryColor.withOpacity(0.5)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      role = 'manager';
                                    });
                                  },
                                  child: const Text('Manager'),
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 200,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        role == 'trainer'
                                            ? primaryColor
                                            : primaryColor.withOpacity(0.5)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      role = 'trainer';
                                    });
                                  },
                                  child: const Text('Trainer'),
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 200,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        role == 'trainee'
                                            ? primaryColor
                                            : primaryColor.withOpacity(0.5)),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      role = 'trainee';
                                    });
                                  },
                                  child: const Text('Trainee'),
                                ),
                              ),
                            ])),

                    const SizedBox(height: 35),
                    // const SizedBox(height: 35),

                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          width: 230,
                          height: 65,
                          child: TextField(
                            controller: firstNameController,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: primaryColor),
                              ),
                              focusColor: primaryColor,
                              prefixIconColor: primaryColor,
                              suffixIconColor: primaryColor,
                              iconColor: primaryColor,
                              labelText: "First Name",
                              // hintText: "Enter a number",/
                              labelStyle: TextStyle(color: primaryColor),
                              filled: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          width: 230,
                          height: 65,
                          child: TextField(
                            controller: lastNameController,
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: primaryColor),
                              ),
                              focusColor: primaryColor,
                              prefixIconColor: primaryColor,
                              suffixIconColor: primaryColor,
                              iconColor: primaryColor,
                              labelText: "Last Name",
                              // hintText: "Enter a number",
                              labelStyle: TextStyle(color: primaryColor),
                              filled: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      width: 200,
                      height: 65,
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          focusColor: primaryColor,
                          prefixIconColor: primaryColor,

                          suffixIconColor: primaryColor,
                          iconColor: primaryColor,
                          labelText: "Email",
                          // hintText: "Enter a number",
                          labelStyle: TextStyle(color: primaryColor),
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      width: 200,
                      height: 65,
                      child: TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          focusColor: primaryColor,
                          prefixIconColor: primaryColor,

                          suffixIconColor: primaryColor,
                          iconColor: primaryColor,
                          labelText: "Phone Number",
                          // hintText: "Enter a number",
                          labelStyle: TextStyle(color: primaryColor),
                          filled: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (role == 'manager')
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        width: 200,
                        height: 65,
                        child: TextField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: primaryColor),
                            ),
                            focusColor: primaryColor,
                            prefixIconColor: primaryColor,
                            suffixIconColor: primaryColor,
                            iconColor: primaryColor,
                            labelText: "Club Description",
                            // hintText: "Enter a number",
                            labelStyle: TextStyle(color: primaryColor),
                            filled: true,
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),

                    Container(
                      padding: EdgeInsets.only(top: 20),
                      width: 200,
                      height: 65,
                      child: TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: primaryColor),
                          ),
                          focusColor: primaryColor,
                          prefixIconColor: primaryColor,
                          suffixIconColor: primaryColor,
                          iconColor: primaryColor,
                          labelText: "Password",
                          // hintText: "Enter a number",
                          labelStyle: TextStyle(color: primaryColor),
                          filled: true,
                        ),
                      ),
                    ),
                    // const SizedBox(height: 20),

                    const SizedBox(height: 10),
                    role == 'trainer'
                        ? Container(
                            padding: EdgeInsets.only(top: 20),
                            width: 200,
                            height: 65,
                            child: TextField(
                              controller: codeController,
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                focusColor: primaryColor,
                                prefixIconColor: primaryColor,
                                suffixIconColor: primaryColor,
                                iconColor: primaryColor,
                                labelText: "Code",
                                // hintText: "Enter a number",
                                labelStyle: TextStyle(color: primaryColor),
                                filled: true,
                              ),
                            ),
                          )
                        : const SizedBox(height: 0),
                    role == 'manager'
                        ? Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                width: 200,
                                height: 65,
                                child: TextField(
                                  controller: clubController,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: primaryColor),
                                    ),
                                    focusColor: primaryColor,
                                    prefixIconColor: primaryColor,
                                    suffixIconColor: primaryColor,
                                    iconColor: primaryColor,
                                    labelText: "Club name",
                                    // hintText: "Enter a number",
                                    labelStyle: TextStyle(color: primaryColor),
                                    filled: true,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 45),
                              //elevated button for go to payment
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: primaryColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      // Routemaster.of(context).replace(registerPath);
                                    },
                                    child: InkWell(
                                      onTap: () async {
                                        print(
                                            "====================================");
                                        print(role);
                                        if (role == 'manager') {
                                          // String username = usernameController.text;
                                          String password =
                                              passwordController.text;
                                          String email = emailController.text;
                                          String clubName = clubController.text;
                                          String description =
                                              descriptionController.text;
                                          String firstName =
                                              firstNameController.text;
                                          String lastName =
                                              lastNameController.text;

                                          String url =
                                              await Provider.of<ApiClient>(
                                                      context,
                                                      listen: false)
                                                  .registerManager(
                                                      firstName,
                                                      lastName,
                                                      password,
                                                      email,
                                                      clubName,
                                                      description);

                                          html.window.open(url, 'payment');
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Icon(Icons.credit_card,
                                              color: primaryColor),
                                          Text(
                                            "Go to payment",
                                            style: GoogleFonts.inter(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              SizedBox(height: 20),
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
                                    if (role == 'trainer') {
                                      ApiClient apiClient =
                                          Provider.of<ApiClient>(context,
                                              listen: false);
                                      bool isReg =
                                          await apiClient.registerTrainer(
                                        codeController.text,
                                        passwordController.text,
                                        emailController.text,
                                        firstNameController.text,
                                        lastNameController.text,
                                        phoneController.text,
                                      );

                                      if (isReg) {
                                        Routemaster.of(context)
                                            .replace(dashboardPath);
                                      }
                                    } else {
                                      ApiClient apiClient =
                                          Provider.of<ApiClient>(context,
                                              listen: false);
                                      bool isReg =
                                          await apiClient.registerTrainee(
                                        emailController.text,
                                        passwordController.text,
                                        firstNameController.text,
                                        lastNameController.text,
                                        phoneController.text,
                                      );

                                      if (isReg) {
                                        Routemaster.of(context)
                                            .replace(dashboardPath);
                                      }
                                    }
                                  },
                                  child: Container(
                                      height: 50,
                                      alignment: Alignment.center,
                                      child: const Text("Register"))),
                            ],
                          ),
                    const SizedBox(height: 15),
                    // already have an account
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Routemaster.of(context).replace(loginPath);
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ])
                  ],
                ),
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
