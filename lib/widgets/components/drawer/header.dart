import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoster/utils/app_image.dart';
import 'package:hoster/utils/app_size.dart';

class CustomDrawerHeader extends StatelessWidget {
  final bool isColapsed;

  const CustomDrawerHeader({
    Key? key,
    required this.isColapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("${AppImage.dashboardImage}logo_icon.png",
              height: 30, width: 30),
          if (isColapsed) const SizedBox(width: 10),
          if (isColapsed)
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: vTextPadding * 2),
                child: Text(
                  'HOSTER',
                  style: GoogleFonts.aldrich(
                      fontWeight: FontWeight.w400, fontSize: 20),
                  maxLines: 1,
                ),
              ),
            ),
          if (isColapsed) const Spacer(),
          if (isColapsed)
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close_rounded),
              ),
            ),
        ],
      ),
    );
  }
}
