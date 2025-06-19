import 'dart:developer';

import 'package:adapp/components/about/about.dart';
import 'package:adapp/components/body/widgets.dart';
import 'package:adapp/components/comments/comments.dart';
import 'package:adapp/components/nav/nav.dart';
import 'package:adapp/components/uploads/uploads.dart';
import 'package:adapp/core/config/color.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _video(context: context, isMobile: isMobile),
              _divider(),
              SliverToBoxAdapter(child: About()),
              SliverToBoxAdapter(child: Uploads()),
              SliverToBoxAdapter(child: Comments()),
            ],
          ),
          Nav(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _divider() {
    return SliverToBoxAdapter(
      child: Container(
        height: 10,
        width: double.infinity,
        decoration: BoxDecoration(color: AppColors.black2),
      ),
    );
  }

  _video({required BuildContext context, required bool isMobile}) {
    log("isMobile:-- $isMobile");
    return SliverAppBar(
      stretch: true,
      expandedHeight: MediaQuery.of(context).size.height,
      flexibleSpace: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: isMobile
            ? VideoPlayerWidget(
                url:
                    "https://ik.imagekit.io/disast3r/short_azuki.mp4?updatedAt=1749833775521")
            : VideoPlayerWidget(
                url:
                    "https://generic-azuki-storage.b-cdn.net/Azuki%20AX%2025%20Campaign/Azuki-AX-2025.mp4",
        ),
      ),
    );
  }
}
