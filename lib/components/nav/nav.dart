import 'dart:ui';

import 'package:adapp/components/body/widgets.dart';
import 'package:adapp/core/config/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  bool get isMobile => MediaQuery.of(context).size.width < 700;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: AppColors.red1, borderRadius: BorderRadius.circular(5)),
            child: Text(
              "FACT FIRE",
              style: GoogleFonts.silkscreenTextTheme()
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          if (!isMobile) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HoverButton(
                  title: 'ABOUT',
                  onTap: () {},
                ),
                HoverButton(
                  title: 'VIDEOS',
                  onTap: () {},
                ),
                HoverButton(
                  title: 'SOCIALS',
                  onTap: () {},
                ),
                HoverButton(
                  title: 'SHOP',
                  onTap: () {},
                ),
              ],
            ),
            HoverButton(
              title: 'CONTACT US',
              onTap: () {},
            ),
          ],
          if (isMobile) ...[
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (context) => SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.white.withOpacity(0.85),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: AppColors.red1,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "FACT FIRE",
                                    style: GoogleFonts.silkscreenTextTheme()
                                        .bodyMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Icon(
                                    CupertinoIcons.multiply,
                                    color: Colors.black,
                                    size: 35,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 40),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.withOpacity(.3)))),
                              child: Text(
                                "ABOUT",
                                style: GoogleFonts.montserratTextTheme()
                                    .bodyLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 22,
                                        color: Colors.black),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.withOpacity(.3)))),
                              child: Text(
                                "VIDEOS",
                                style: GoogleFonts.montserratTextTheme()
                                    .bodyLarge!
                                    .copyWith(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 22,
                                        color: Colors.black),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.withOpacity(.3)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "SOCIALS",
                                    style: GoogleFonts.montserratTextTheme()
                                        .bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 22,
                                            color: Colors.black),
                                  ),
                                  Icon(CupertinoIcons.arrow_right,
                                      color: Colors.black)
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.withOpacity(.3)))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "CONTACT US",
                                    style: GoogleFonts.montserratTextTheme()
                                        .bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 22,
                                            color: AppColors.red1),
                                  ),
                                  Icon(CupertinoIcons.arrow_right,
                                      color: AppColors.red1)
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "LICENSE",
                              style: GoogleFonts.silkscreenTextTheme()
                                  .bodySmall!
                                  .copyWith(color: Colors.grey, fontSize: 12),
                            ),
                            Text(
                              "TERMS & CONDITIONS",
                              style: GoogleFonts.silkscreenTextTheme()
                                  .bodySmall!
                                  .copyWith(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Icon(
                CupertinoIcons.bars,
                color: Colors.white,
                size: 35,
              ),
            )
          ],
        ],
      ),
    );
  }
}
