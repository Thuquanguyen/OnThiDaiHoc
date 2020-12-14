
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'api_url.dart';

final String TOAN = "toan";
final String VAT_LY = "ly";
final String HOA_HOC = "hoa";
final String NGU_VAN = "van";
final String TIENG_ANH = "tanh";
final String SINH_HOC = "sinh";
final String LICH_SU = "su";
final String DIA_LY = "dia";
final String KHAC = "khac";

String getSlug(String slug) {
  return BASE_URL;
}

int convertCorrect(String correct) {
  switch (correct) {
    case 'a':
      return 0;
    case 'b':
      return 1;
    case 'c':
      return 2;
    case 'd':
      return 3;
    default:
      return 0;
  }
}

String convertInCorrect(int correct) {
  switch (correct) {
    case 0:
      return 'a';
    case 1:
      return 'b';
    case 2:
      return 'c';
    case 3:
      return 'd';
    default:
      return 'a';
  }
}

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}