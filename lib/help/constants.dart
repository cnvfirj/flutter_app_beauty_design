
import 'package:flutter/material.dart';

class BuildCoefficient{

  static final double H_APP_BAR = 0.07;
  static final double H_BOUNDARIES = 0.1;
  static final double H_HISTORY = 0.5;
  static final double H_EX = 0.2;
  static final double WIN_FONT_SIZE = 0.018;
  static final double MASSAGE_FONT_SIZE = 0.03;

  static final double SIDE_SHIFT_WIN = 0.9;
  static final double H_BUKMARK = 0.010;
  static final double H_BUK = 0.04;
  static final double H_BOTTOM_BAR = 0.3;

  static final double R_CIRCLE_ANGLES_WID = 20;

}

class GlobalColors{
  static final Color COLOR_MAIN_FONT = Color.fromRGBO(226, 226, 226, 1.0);
  static final Color COLOR_TEXT = Colors.white;
  static final Color COLOR_WIN_GENERATOR = Color.fromRGBO(62, 130, 151, 1.0);
  static final Color COLOR_WIN_BOUND = Color.fromRGBO(58, 53, 128, 1.0);
  static final Color COLOR_WIN_EX = Color.fromRGBO(128, 46, 46, 1.0);
  static final Color COLOR_WIN_HIST = Color.fromRGBO(104, 55, 76, 1.0);
}

enum NamesWidgets{
  GENERATE,
  BOUNDARIES,
  EXCLUDES,
  HISTORY
}
