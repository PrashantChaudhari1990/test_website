import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle? textStyle(
    String type, FontWeight? fontWeight, double? fontSize, Color? color) {
  switch (type) {
    case 'jost':
      return GoogleFonts.jost(
          fontWeight: fontWeight, fontSize: fontSize, color: color);
    case 'lato':
      return GoogleFonts.lato(
          fontWeight: fontWeight, fontSize: fontSize, color: color);
    case 'nunito':
      return GoogleFonts.nunito(
          fontWeight: fontWeight, fontSize: fontSize, color: color);
    case 'poppins':
      return GoogleFonts.poppins(
          fontWeight: fontWeight, fontSize: fontSize, color: color);
  }
  return GoogleFonts.poppins(
      fontWeight: fontWeight, fontSize: fontSize, color: color);
}
