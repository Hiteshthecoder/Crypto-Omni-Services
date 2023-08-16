import 'dart:math';

import 'package:crypto_omni_services/logic/bottom_navbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logger/logger.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarCubit, BottomNavbarStates>(
      buildWhen: (previous, current) => previous.currIndex != current.currIndex,
      builder: (context, state) {
        return BottomNavigationBar(
          onTap: (currIndex) => context.read<BottomNavbarCubit>().changeCurrIndex(currIndex),
          currentIndex: BlocProvider.of<BottomNavbarCubit>(context).state.currIndex!,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "Exchange",
              icon: Icon(
                Icons.currency_exchange_sharp,
              ),
            ),
            BottomNavigationBarItem(
              label: "Transfer",
              icon: Icon(
                Icons.trending_up_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: "Waller",
              icon: Icon(
                Icons.wallet_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.person_4_rounded,
              ),
            ),
          ],
        );
      },
    );
  }
}

class CustomLogs {
  static Logger logger = new Logger();

  static int getNftRandom() {
    return Random().nextInt(getNftCollections().length - 1);
  }

  static List getNftCollections() {
    return ["degods", "remivision", "gemesis", "himalayainc", "plutomisfits"];
  }

  static SystemUiOverlayStyle appSystemUiOverlayStyle() {
    return SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarColor: Colors.black,
    );
  }

  static ThemeData appTheme(BuildContext context) {
    return ThemeData(
      androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ).copyWith(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedIconTheme: IconThemeData(
          color: Colors.blue,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.all(
            CustomLogs.getCustomHeight(
              context,
              1.6,
            ),
          ),
          side: BorderSide(
            width: 1,
            color: Colors.white.withOpacity(0.4),
          ),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
          backgroundColor: HexColor(
            "#E8F5FF",
          ).withOpacity(0.2),
        ),
      ),
      scaffoldBackgroundColor: Colors.deepPurple.withOpacity(0.7),
    );
  }

  static logCustomLogs(String error, Level level, StackTrace? stackTrace) {
    logger.log(
      level,
      error,
      stackTrace: stackTrace,
      error: error,
    );
    logger.close();
  }

  static double getCustomHeight(BuildContext context, double heightInPercentage) {
    return ((MediaQuery.of(context).size.height) * heightInPercentage) / 100;
  }

  static double getCustomWidth(BuildContext context, double widthInPercentage) {
    return ((MediaQuery.of(context).size.width) * widthInPercentage) / 100;
  }

  static AppBar customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.notifications_none_rounded,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CustomLogs.getCustomWidth(
              context,
              4,
            ),
          ),
          child: Icon(
            Icons.qr_code_scanner_sharp,
          ),
        ),
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final Clip? clipBehavior;
  final double? height;
  final double? width;
  final Alignment? alignment;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  CustomContainer({
    super.key,
    this.margin,
    this.alignment,
    this.padding,
    this.child,
    this.decoration,
    required this.width,
    this.clipBehavior = Clip.none,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      child: child,
      decoration: decoration,
      width: width,
      clipBehavior: clipBehavior!,
      height: height,
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  final String string;
  final Color? textColor;
  final double? fontSize;
  final List<Shadow>? shadows;
  final TextStyle? textStyle;
  final Color? backgroudColor;
  final TextDecoration? textDecoration;
  final double? letterSpacing;
  final double? wordSpacing;
  final FontWeight? fontWeight;
  CustomTextWidget({
    super.key,
    this.textColor = Colors.white,
    this.fontSize = 18,
    required this.string,
    this.shadows,
    this.textStyle,
    this.letterSpacing = 1,
    this.backgroudColor,
    this.textDecoration,
    this.wordSpacing,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      style: GoogleFonts.albertSans(
        fontSize: fontSize,
        textStyle: textStyle,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color: textColor,
        backgroundColor: backgroudColor,
        decoration: textDecoration,
        wordSpacing: wordSpacing,
        shadows: shadows,
      ),
    );
  }
}
