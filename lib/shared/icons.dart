import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppIcons {
  // svg
  static String get dashboard => "svg/dashboard.svg";
  static String get drivers => "svg/drivers.svg";
  static String get flow => "svg/flow.svg";
  static String get back => "svg/menuBack.svg";
  static String get back_android => "svg/back-android.svg";
  static String get teams => "svg/teams.svg";
  static String get merchants => "svg/merchants.svg";
  static String get settings => "svg/settings.svg";
  static String get logout => "svg/logout.svg";
  static String get undo => "svg/undo.svg";
  static String get redo => "svg/redo.svg";
  static String get lightning => "svg/lightning.svg";
  static String get halfCircle => "svg/halfCircle.svg";
  static String get analyze => "svg/analyze.svg";
  static String get calendar => "svg/calendar.svg";
  static String get circle => "svg/circle.svg";
  static String get columns => "svg/columns.svg";
  static String get delete => "svg/delete.svg";
  static String get map => "svg/map.svg";
  static String get pencil => "svg/pencil.svg";
  static String get printer => "svg/printer.svg";
  static String get search => "svg/search.svg";
  static String get table => "svg/table.svg";
  static String get payment => "svg/money-svgrepo-com.svg";
  static String get invoice => "svg/invoice-money-svgrepo-com.svg";
  static String get security => "svg/security-svgrepo-com.svg";
  static String get help => "svg/help.svg";
  static String get operationalFlow => "svg/view-operational-flow.svg";
  static String get edit => "svg/edit.svg";
  static String get subadmin => "svg/subadmin.svg";
  static String get driver => "svg/driver.svg";
  static String get add => "svg/add.svg";
  static String get bag => "svg/bag.svg";
  static String get permissions => "svg/permissions.svg";
  static String get filter => "svg/filter.svg";
  static String get locations => "svg/location.svg";
  static String get clock => "svg/clock.svg";
  static String get chevronDown => "assets/svg/chevron-down.svg";
  static String get edit2 => "assets/svg/edit2.svg";

  // png
  static String get arrow_down => "arrow.png";
  static String get logo => "logo.png";
  static String get dots => "assets/dots.png";
  static String get empty_flow => "assets/empty-flow.png";

  static svgAsset(
    String path, {
    double? width,
    double? height,
    Color? color,
  }) {
    return SvgPicture.asset(
      path,
      width: width ?? 24,
      height: height ?? 24,
      color: color,
    );
  }
}
