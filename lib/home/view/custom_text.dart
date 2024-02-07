
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/dimensions.dart';


Text customGeneralTextNunitoSansCenter({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(
    inputText,
    textAlign: TextAlign.center,
    style: GoogleFonts.nunitoSans(
        fontSize: getProportionateScreenWidth(fontSize),
        fontWeight: weight,
        color: colorName),
  );
}

Text customTextNunitoSansCenter({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(
    inputText,
    style: GoogleFonts.nunitoSans(
        fontSize: getProportionateScreenWidth(fontSize),
        fontWeight: weight,
        color: colorName),
  );
}


Text customTextNunitoSansCenterr({
  required String inputText,
  required double letterSpacing,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(
    inputText,
    style: GoogleFonts.nunitoSans(
        fontSize: getProportionateScreenWidth(fontSize),
        fontWeight: weight,
        color: colorName),
  );
}

Text customTextNunitoSansCenter2({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text.rich(TextSpan(children: [
    TextSpan(
      text: inputText,
      style: GoogleFonts.nunitoSans(
          fontSize: getProportionateScreenWidth(fontSize),
          fontWeight: weight,
          color: colorName),
    )
  ]));
}

Text customTextNunitoSansCenter3({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text.rich(TextSpan(children: [
    TextSpan(
      text: inputText,
      style: GoogleFonts.nunitoSans(
          fontSize: getProportionateScreenWidth(fontSize),
          fontWeight: weight,
          color: colorName),
    )
  ]));
}
