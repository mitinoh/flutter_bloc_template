import 'package:flutter/material.dart';
import 'package:flutter_bloc_template/utils/const/COLOR_CONST.dart';

class ThemeX {
  static final darkTheme = ThemeData(
      primaryColor: COLOR_CONST.DEFAULT100,
      disabledColor: COLOR_CONST.WHITE50,
      indicatorColor: COLOR_CONST.WHITE80, // usato come testo
      scaffoldBackgroundColor: COLOR_CONST.BLACK80,
      cardColor: COLOR_CONST.WHITE2,
      backgroundColor: COLOR_CONST.GREY,
      canvasColor: COLOR_CONST.BLACK100,
      focusColor: COLOR_CONST.ACCENT100,
      primaryColorLight: COLOR_CONST.WHITE10,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory);

  static final lightTheme = ThemeData(
      primaryColor: COLOR_CONST.DEFAULT100,
      disabledColor: COLOR_CONST.BLACK50,
      indicatorColor: COLOR_CONST.BLACK80,
      scaffoldBackgroundColor: COLOR_CONST.WHITE80,
      cardColor: COLOR_CONST.BLACK2,
      backgroundColor: COLOR_CONST.DIRTYWHITE,
      canvasColor: COLOR_CONST.WHITE100,
      focusColor: COLOR_CONST.ACCENT100,
      primaryColorLight: COLOR_CONST.BLACK10,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory);
}
