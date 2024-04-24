import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hoster/mobile_screens/layout.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/utils/app_image.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/web_screens/home_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoNext();
  }

  gotoNext() {
    if (kIsWeb) {
      return Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        ));
      });
    } else if (Platform.isAndroid || Platform.isIOS) {
      return Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const LayoutScreen();
          },
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Lottie.asset('${AppLoader.webLoader}web_loader.json',
              height: MediaQuery.of(context).size.width <= vScreenWidthSm
                  ? 150
                  : 200)),
    );
  }
}
