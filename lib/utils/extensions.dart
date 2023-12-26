import 'package:flutter/material.dart';

extension TextStyleWeight on TextStyle {
  TextStyle fontWeight400(double fontSize,{Color fontColor = Colors.black}) =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: fontSize,color: fontColor);

  TextStyle fontWeight500(double fontSize,{Color fontColor = Colors.black}) =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: fontSize,color: fontColor);

  TextStyle fontWeight600(double fontSize, {Color fontColor = Colors.black}) =>
      TextStyle(
          fontWeight: FontWeight.w600, fontSize: fontSize, color: fontColor);

  TextStyle fontWeight900(double fontSize) =>
      TextStyle(fontWeight: FontWeight.w900, fontSize: fontSize);

  TextStyle fontWeight800(double fontSize,{Color fontColor = Colors.black}) =>
      TextStyle(fontWeight: FontWeight.w800, fontSize: fontSize,color: fontColor);

  TextStyle fontWeight700(double fontSize,{Color fontColor = Colors.black}) =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: fontSize,color: fontColor);
}
