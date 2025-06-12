import 'package:adapp/core/config/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  List list = [
    {
      "icon": FontAwesomeIcons.gamepad,
      "title": "GAME PLAYING",
      "subtitle": "FREE FIRE"
    },
    {"icon": FontAwesomeIcons.youtube, "title": "YOUTUBE", "subtitle": "5.6 M"},
    {
      "icon": FontAwesomeIcons.usersViewfinder,
      "title": "VIEWS",
      "subtitle": "16.9 M"
    },
    {"icon": FontAwesomeIcons.thumbsUp, "title": "LIKES", "subtitle": "11.5 M"},
    {
      "icon": FontAwesomeIcons.instagram,
      "title": "INSTAGRAM",
      "subtitle": "6.2 M"
    },
    {
      "icon": FontAwesomeIcons.telegram,
      "title": "TELEGRAM",
      "subtitle": "13.6 K"
    },
    {
      "icon": FontAwesomeIcons.telegram,
      "title": "TELEGRAM",
      "subtitle": "13.6 K"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.black1),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(height: 70),
          Stack(
            children: [
              SizedBox(
                width: 200,
                height: 50,
              ),
              Positioned(
                  bottom: 10,
                  left: 0,
                  child: Container(
                    height: 10,
                    width: 120,
                    decoration: BoxDecoration(color: AppColors.red1),
                  )),
              Positioned(
                bottom: 0,
                left: 10,
                child: Text(
                  "FACT FIRE",
                  style: GoogleFonts.josefinSansTextTheme()
                      .headlineLarge!
                      .copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30),
                ),
              ),
            ],
          ),
          SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image(),
              SizedBox(width: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PROFESSION",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white60, fontWeight: FontWeight.w100),
                  ),
                  Row(
                    children: [
                      Text(
                        "CONTENT CREATOR",
                        style: GoogleFonts.silkscreenTextTheme()
                            .bodyLarge!
                            .copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                      ),
                      SizedBox(width: 130),
                      Icon(FontAwesomeIcons.diamond),
                      SizedBox(width: 10),
                      Icon(FontAwesomeIcons.staffSnake),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    constraints: BoxConstraints(maxWidth: 250 + 250 + 20),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(list.length, (i) {
                        return _tile(
                            icon: list[i]["icon"],
                            title: list[i]["title"],
                            subtitle: list[i]["subtitle"]);
                      }),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.fire),
              SizedBox(width: 20),
              Icon(FontAwesomeIcons.water),
              SizedBox(width: 20),
              Icon(FontAwesomeIcons.earthAsia),
            ],
          )
        ],
      ),
    );
  }

  _tile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.black2,
        borderRadius: BorderRadius.circular(5),
      ),
      width: 250,
      child: Row(
        children: [
          FaIcon(icon, color: Colors.white),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.ibmPlexSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.white70, // More visible
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.ibmPlexSans(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ClipRRect _image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        "https://joseph.cv/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flore-chapter-one.7fe105c5.jpg&w=1920&q=75",
        fit: BoxFit.cover,
        height: 400,
        width: 400,
      ),
    );
  }
}
