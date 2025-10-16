
import 'package:flutter/material.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/app_bar_theme.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/text_field_theme.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/text_theme.dart';
class TAppTheme {
  TAppTheme._();

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'inter',
    disabledColor: Colors.grey,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: RTextTheme.darkTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: RAppBarTheme.darkAppBarTheme,
    checkboxTheme: RCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: RBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: RElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: RTextFormFieldTheme.darkInputDecorationTheme

  );
}