import 'package:adapp/core/config/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Uploads extends StatefulWidget {
  const Uploads({super.key});

  @override
  State<Uploads> createState() => _UploadsState();
}

class _UploadsState extends State<Uploads> {
  List list = [
    {
      "label": "BEANS 102",
      "image":
          "https://images.unsplash.com/photo-1618519764620-7403abdbdfe9?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "label": "BEANS 304",
      "image":
          "https://images.unsplash.com/photo-1594712844133-d4193f13c17e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "label": "BEANS 203",
      "image":
          "https://images.unsplash.com/photo-1601645191163-3fc0d5d64e35?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "label": "BEANS 102",
      "image":
          "https://images.unsplash.com/photo-1618519764620-7403abdbdfe9?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "label": "BEANS 203",
      "image":
          "https://images.unsplash.com/photo-1601645191163-3fc0d5d64e35?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "label": "BEANS 304",
      "image":
          "https://images.unsplash.com/photo-1594712844133-d4193f13c17e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
  ];

  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 20,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: AppColors.black2, borderRadius: BorderRadius.circular(5)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(list.length, (i) {
            final isHovered = hoveredIndex == i;
            return MouseRegion(
              onEnter: (_) => setState(() => hoveredIndex = i),
              onExit: (_) => setState(() => hoveredIndex = null),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeOut,
                margin: EdgeInsets.only(right: 5),
                width: 350,
                height: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        list[i]['image'],
                        width: 350,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      switchInCurve: Curves.easeOutBack,
                      switchOutCurve: Curves.easeInBack,
                      child: isHovered
                          ? SizedBox.shrink()
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: TweenAnimationBuilder<double>(
                                tween: Tween(begin: 1, end: isHovered ? 0 : 1),
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                builder: (context, value, child) {
                                  return Transform.scale(
                                    scale: value,
                                    child: Opacity(
                                      opacity: value,
                                      child: child,
                                    ),
                                  );
                                },
                                child: ColorFiltered(
                                  colorFilter:
                                      const ColorFilter.matrix(<double>[
                                    0.2126,
                                    0.7152,
                                    0.0722,
                                    0,
                                    0,
                                    0.2126,
                                    0.7152,
                                    0.0722,
                                    0,
                                    0,
                                    0.2126,
                                    0.7152,
                                    0.0722,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    1,
                                    0,
                                  ]),
                                  child: Container(
                                    width: 350,
                                    height: double.infinity,
                                    foregroundDecoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Image.network(
                                      list[i]['image'],
                                      width: 350,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                    // Black box at the bottom when hovered
                    if (isHovered)
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: AnimatedOpacity(
                          opacity: isHovered ? 1 : 0,
                          duration: Duration(milliseconds: 300),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 0),
                            decoration: BoxDecoration(color: AppColors.black2),
                            alignment: Alignment.center,
                            child: Text(
                              list[i]['label'],
                              style: GoogleFonts.silkscreenTextTheme()
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
