import 'package:flutter/material.dart';


import '../Resours_Manger/Color_Manger.dart';
import '../Resours_Manger/Font_Manger.dart';
import '../Resours_Manger/Style_Manger.dart';
import '../Resours_Manger/Values_Manger.dart';

ThemeData getAppTheme() => ThemeData(
    //main color
     primaryColor: ColorManager.primary,

    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.scondry,
        titleTextStyle:
            getRegularStyle(fontSize: AppSize.s16, color: ColorManager.white)),

    //
    //
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ElevatedButton.styleFrom(
    //         backgroundColor: ColorManager.primary,
    //         textStyle: getRegularStyle(
    //             fontSize: AppSize.s17, color: ColorManager.white),
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(AppSize.s8)),
    //         shadowColor: ColorManager.lightPrimary)),
    textTheme: TextTheme(
        displaySmall:
            getRegularStyle(color: ColorManager.gray, fontSize: FontSize.s14),
        headlineLarge: getSemiBoldStyle(
            color: ColorManager.dark, fontSize: FontSize.s16),
        bodySmall: getRegularStyle(color: ColorManager.gray, fontSize: FontSize.s14),
    ),
    //
    // inputDecorationTheme: InputDecorationTheme(
    //
    //     contentPadding: EdgeInsets.all(AppPadding.p8),
    //     hintStyle:
    //         getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
    //     labelStyle:
    //         getMediumStyle(color: ColorManager.grey, fontSize: FontSize.s14),
    //     errorStyle: getRegularStyle(color: ColorManager.error),
    //     enabledBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //     focusedBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //     errorBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.error, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    //     focusedErrorBorder: OutlineInputBorder(
    //         borderSide:
    //             BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    //         borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),


    //button Theme

    // Text Theme

    //input decoration Theme (Text form field)
    );



// buttonTheme: ButtonThemeData(
//   shape:const StadiumBorder(),
//   disabledColor: ColorManager.grey1,
//   buttonColor: ColorManager.primary,
//   splashColor: ColorManager.lightPrimary
// ),