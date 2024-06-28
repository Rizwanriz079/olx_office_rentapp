import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String api ="http://127.0.0.1:8000/";

class AppTextStyles {
  static final TextStyle aBeeZee30Bold = GoogleFonts.aBeeZee(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: 2,
  );
  static final TextStyle aBeeZee30BoldB = GoogleFonts.aBeeZee(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color:  Color(0xFF0B3760),
    letterSpacing: 2,
  );


  static final TextStyle aBeeZee20Bold = GoogleFonts.aBeeZee(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 1,
  );
  static final TextStyle aBeeZee25Bold = GoogleFonts.aBeeZee(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 1,
  );

  static final TextStyle aBeeZee16Bold = GoogleFonts.aBeeZee(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: 1,
  );
  static final TextStyle aBeeZee16 = GoogleFonts.aBeeZee(
    fontSize: 16,
    color: Colors.black,
    letterSpacing: 1,
  );
  static final TextStyle aBeeZee18 = GoogleFonts.aBeeZee(
    fontSize: 18,
    color: Colors.black,
    letterSpacing: 1,
  );
  static final TextStyle aBeeZee18Bold = GoogleFonts.aBeeZee(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: 1,
  );

  static final TextStyle aBeeZee16Blue = GoogleFonts.aBeeZee(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0B3760),
  );

  static final TextStyle aBeeZee14ItalicGrey = GoogleFonts.aBeeZee(
    fontSize: 14,
    fontStyle: FontStyle.italic,
    color: Colors.grey,
  );

  static final TextStyle aBeeZee14 = GoogleFonts.aBeeZee(
    fontSize: 14,
    color: Colors.black,
  );

  static final TextStyle aBeeZee14LightBold = GoogleFonts.aBeeZee(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static final TextStyle aBeeZee10 = GoogleFonts.aBeeZee(
    fontSize: 10,
    color: Colors.black,
  );
}


const kheight5 = SizedBox(height: 5);
const kheight10 = SizedBox(height: 10);
const kheight20 = SizedBox(height: 20);
const kheight15 = SizedBox(height: 15);


const kwidth5 = SizedBox(width:  5);
const kwidth10 = SizedBox(width:  10);
const kwidth20 = SizedBox(width:  20);