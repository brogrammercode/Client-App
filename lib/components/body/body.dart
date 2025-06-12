import 'package:adapp/components/about/about.dart';
import 'package:adapp/components/body/widgets.dart';
import 'package:adapp/components/uploads/uploads.dart';
import 'package:adapp/core/config/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _video(context),
              _divider(),
              SliverToBoxAdapter(child: About()),
              SliverToBoxAdapter(child: Uploads()),
            ],
          ),
          _nav(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _divider() {
    return SliverToBoxAdapter(
      child: Container(
        height: 20,
        width: double.infinity,
        decoration: BoxDecoration(color: AppColors.black2),
      ),
    );
  }

  Padding _nav() {
    return Padding(
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
      ),
    );
  }

  _video(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      expandedHeight: MediaQuery.of(context).size.height,
      flexibleSpace: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: VideoPlayerWidget(
          url:
              "https://generic-azuki-storage.b-cdn.net/Azuki%20AX%2025%20Campaign/Azuki-AX-2025.mp4",
        ),
      ),
    );
  }
}
