import 'package:adapp/components/comments/widgets.dart';
import 'package:adapp/core/config/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  int currentIndex = 0;
  late final List<Map<String, String>> comments;

  @override
  void initState() {
    super.initState();
    comments = [
      {
        "dp":
            "https://joseph.cv/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Flore-chapter-one.7fe105c5.jpg&w=1920&q=75",
        "name": "BILBILI CHEERS",
        "comment":
            "Your videos are super helpful and crazy, Also congrats for 8M.",
        "td": "24 March",
      },
      {
        "dp":
            "https://images.unsplash.com/photo-1541562232579-512a21360020?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGFuaW1lfGVufDB8fDB8fHww",
        "name": "JON DOE",
        "comment":
            "That last video was lit! Learned a lot. Appreciate your hard work.",
        "td": "01 April",
      },
      {
        "dp":
            "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGVvcGxlfGVufDB8fDB8fHww",
        "name": "LISA K",
        "comment":
            "Following you since 2K subs. Keep rocking like before and make it to 10M.",
        "td": "15 May",
      },
    ];

    _startAutoSwitching();
  }

  void _startAutoSwitching() {
    Future.doWhile(() async {
      await Future.delayed(Duration(seconds: 4));
      if (!mounted) return false;
      setState(() {
        currentIndex = (currentIndex + 1) % comments.length;
      });
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    final current = comments[currentIndex];

    return Container(
      height: isMobile ? 300 : MediaQuery.of(context).size.height * .6,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: DottedBackgroundPainter(
                dotColor: Colors.grey.withOpacity(0.45),
                dotSpacing: 32,
                dotRadius: 2,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: isMobile ? 300 : 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: isMobile ? 5 : 5),
                    decoration: BoxDecoration(
                      color: AppColors.red1,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "FACT FIRE",
                      style: GoogleFonts.silkscreenTextTheme()
                          .headlineLarge!
                          .copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: isMobile ? 16 : 25,
                          ),
                    ),
                  ),
                  SizedBox(height: isMobile ? 40 : 80),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 800),
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeOut,
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                    child: _buildComment(current,
                        key: ValueKey(current["name"]), isMobile: isMobile),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComment(Map<String, String> comment,
      {required Key key, required bool isMobile}) {
    return Row(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(color: AppColors.black1, width: isMobile ? 3 : 5),
          ),
          child: ClipOval(
            child: Image.network(
              comment["dp"]!,
              height: isMobile ? 50 : 100,
              width: isMobile ? 50 : 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comment["name"]!,
                style: GoogleFonts.publicSansTextTheme().bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black1,
                      fontSize: isMobile ? 17 : 26,
                    ),
              ),
              SizedBox(height: 5),
              Text(
                comment["comment"]!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black1,
                      fontSize: isMobile ? 14 : 20,
                    ),
              ),
              SizedBox(height: 15),
              Text(
                comment["td"]!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: isMobile ? 13 : 20),
              ),
            ],
          ),
        )
      ],
    );
  }
}
