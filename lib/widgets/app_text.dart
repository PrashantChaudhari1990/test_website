import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontWeight;
  final double? wordspace;
  final bool textCenter;
  final dynamic foreground;
  final double? laterspacing;
  final String? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final String? textDirection;

  const AppText({
    Key? key,
    required this.text,
    this.textDirection,
    this.color,
    this.fontsize,
    this.fontWeight,
    this.wordspace,
    this.laterspacing,
    this.decoration,
    this.foreground,
    this.style,
    this.maxLines,
    this.overflow,
    this.textCenter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overflow ?? TextOverflow.clip,
        maxLines: maxLines,
        textAlign: textCenter == true ? TextAlign.center : textAlign(),
        // textAlign: textCenter ? TextAlign.center : null,
        style: textStyles());
  }

  TextStyle? textStyles() {
    switch (style) {
      case 'poppins':
        return GoogleFonts.poppins(
            letterSpacing: laterspacing,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: fontsize ?? 14,
            color: color,
            fontStyle: FontStyle.normal);
      case 'jost':
        return GoogleFonts.jost(
            letterSpacing: laterspacing,
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: fontsize ?? 14,
            color: color,
            fontStyle: FontStyle.normal);
      case 'lato':
        return GoogleFonts.lato(
            letterSpacing: laterspacing,
            fontWeight: fontWeight,
            fontSize: fontsize,
            color: color,
            fontStyle: FontStyle.normal);
      case 'nunito':
        return GoogleFonts.nunito(
            fontWeight: fontWeight,
            fontSize: fontsize,
            color: color,
            fontStyle: FontStyle.normal);
    }
    return GoogleFonts.poppins(
        letterSpacing: laterspacing,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontsize ?? 14,
        color: color,
        fontStyle: FontStyle.normal);
  }

  TextAlign? textAlign() {
    switch (textDirection) {
      case "lefttoright":
        return TextAlign.right;
      case "righttoleft":
        return TextAlign.left;
    }
    return TextAlign.left;
  }
}
