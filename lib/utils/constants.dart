import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String loginPath = '/login';
const String registerPath = '/register';
const String profilePath = '/profile';
const String dashboardPath = '/dashboard';
const String apiUrl = 'https://178.128.194.222/api';

const Color primaryColor = Color.fromARGB(255, 98, 15, 252);
const Color secondaryColor = Color.fromARGB(255, 188, 158, 248);
// const Color secondaryColor = Color.fromARGB(255, 255, 255, 255);

const List<String> sports = [
  "Football (Soccer)",
  "Basketball",
  "Tennis",
  "Baseball",
  "Golf",
  "American Football",
  "Rugby",
  "Cricket",
  "Volleyball",
  "Hockey",
  "Badminton",
  "Table Tennis",
  "Swimming",
  "Athletics (Track and Field)",
  "Boxing",
  "Wrestling",
  "Martial Arts",
  "Gymnastics",
  "Cycling",
  "Formula 1 Racing",
  "Motorbike Racing",
  "Surfing",
  "Skateboarding",
  "Snowboarding",
  "Skiing",
  "Sailing",
  "Canoeing/Kayaking",
  "Rowing",
  "Equestrian",
  "Archery",
  "Shooting",
  "Triathlon",
  "Weightlifting",
  "Mountaineering",
  "Bobsleigh",
  "Curling",
  "Darts",
  "Lacrosse"
];

AppBar basicAppBar = AppBar(
    title: Row(
      children: [
        Text(
          'Olimpiac',
          style: GoogleFonts.inter(
            fontSize: 20,
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'OS',
          style: GoogleFonts.inter(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        )
      ],
    ),
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ));

Widget logo(double dimension) {
  return Row(children: [
    Text(
      'Olimpiac',
      style: GoogleFonts.inter(
        fontSize: 20 * dimension,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      'OS',
      style: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 25 * dimension,
          fontWeight: FontWeight.bold),
    )
  ]);
}

// meniu lateral
const List<Map<String, dynamic>> menus = [
  {
    'title': 'Dashboard',
    'icon': Icons.create,
    'number': 0,
  },
  {
    'title': 'Add',
    'icon': Icons.add,
    'number': 1,
  },
  {
    'title': 'Payment',
    'icon': Icons.payment,
    'number': 2,
  },
  {
    'title': 'Termeni și condiții',
    'icon': Icons.library_books_outlined,
    'number': 3,
  },
];
