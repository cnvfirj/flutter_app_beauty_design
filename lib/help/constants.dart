
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/ui/common/CommonWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  static final Color COLOR_TEXT = Color.fromRGBO(255, 255, 255, 1.0);
  static final Color COLOR_BACKGROUND_WIDGET = Color.fromRGBO(255, 255, 255, 1.0);
  static final Color COLOR_WIDGET_TEXT = Colors.black;
  static final Color COLOR_WIN_GENERATOR = Color.fromRGBO(62, 130, 151, 1.0);
  static final Color COLOR_WIN_BOUND = Color.fromRGBO(58, 53, 128, 1.0);
  static final Color COLOR_WIN_EX = Color.fromRGBO(128, 46, 46, 1.0);
  static final Color COLOR_WIN_HIST = Color.fromRGBO(104, 55, 76, 1.0);
}

class GlobalSizes{
  static final double FONT_SIZE = 30;
  static final double HORIZONTAL_PADDING = 5;
  static final double DELIMITER = 2;
}

class GlobalValues{
  static final int MAX_DIAPAZON = 4294967295;
}

class GlobalKeys{
  static final String KEY_POS_GENERATE = 'Position_Common_Widget_Generate';
  static final String KEY_POS_BOUNDARIES = 'Position_Common_Widget_Boundaries';
  static final String KEY_POS_EXDLUDES = 'Position_Common_Widget_Excludes';
  static final String KEY_POS_HISTORY = 'Position_Common_Widget_History';
  static final String KEY_POS_DIALOG_ADD_EX = 'Position_Common_Widget_Add_Ex';

  static String key(NamesWidgets name, String prefix){
    if(name==NamesWidgets.GENERATE)return '$prefix${GlobalKeys.KEY_POS_GENERATE}';
    else if(name==NamesWidgets.BOUNDARIES)return '$prefix${GlobalKeys.KEY_POS_BOUNDARIES}';
    else if(name==NamesWidgets.EXCLUDES)return '$prefix${GlobalKeys.KEY_POS_EXDLUDES}';
    else if(name==NamesWidgets.DIALOG_ADD_EX)return '$prefix${GlobalKeys.KEY_POS_DIALOG_ADD_EX}';
    else return '$prefix${GlobalKeys.KEY_POS_HISTORY}';
  }
}

class GlobalKeySource{
  static final String KEY_APP_GENERATE = 'Generated Application';
  static final String KEY_MAN_GENERATE = 'Generated Manual';
}

enum NamesWidgets{
  GENERATE,
  BOUNDARIES,
  EXCLUDES,
  HISTORY,
  DIALOG_ADD_EX
}


