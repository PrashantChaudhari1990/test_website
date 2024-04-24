import 'package:flutter/material.dart';
import 'package:hoster/core/locale/language.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/widgets/app_text.dart';
import 'package:provider/provider.dart';

class CopyRight extends StatefulWidget {
  final String isTextstyleType;
  final String isDirectionType;
  const CopyRight(
      {super.key,
      required this.isTextstyleType,
      required this.isDirectionType});

  @override
  State<CopyRight> createState() => CcopRrightState();
}

class CcopRrightState extends State<CopyRight> {
  DarkThemeProvider? themeChange;
  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: AppColor.copyrightbg,
      child: Center(
        child: AppText(
          text: Languages.of(context)!.copyRight,
          style: widget.isTextstyleType,
          textDirection: widget.isDirectionType,
          color: AppColor.whiteColor,
          fontsize:
              MediaQuery.of(context).size.width <= vScreenWidthSm ? 10 : 13,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
