import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String loginPath = '/login';
const String registerPath = '/register';
const String profilePath = '/profile';
const String apiUrl = 'http://localhost:3000/api';

const Color primaryColor = Color.fromARGB(255, 98, 15, 252);

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
