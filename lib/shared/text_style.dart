import 'package:flutter/material.dart';
import 'package:get_meat_apps/shared/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetMeatTextStyle {
  static TextStyle blackFontStyle1 = GoogleFonts.nunito().copyWith(
      color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600);

  static TextStyle blackFontStyle2 = GoogleFonts.nunito().copyWith(
      color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600);

  static TextStyle whiteFontStyle1 = GoogleFonts.nunito().copyWith(
      color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w600);

  static TextStyle whiteFontStyle2 = GoogleFonts.nunito().copyWith(
      color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600);

  static TextStyle grayFontStyle1 = GoogleFonts.nunito().copyWith(
      color: GetMeatColors.lightGray,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400);

  static TextStyle grayFontStyle2 = GoogleFonts.nunito().copyWith(
      color: GetMeatColors.lightGray,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400);
}
