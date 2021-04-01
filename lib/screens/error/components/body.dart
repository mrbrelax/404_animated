import 'dart:math';

import 'package:animated_error_page/screens/error/components/error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  final Duration duration = Duration(milliseconds: 500);
  bool startAnimation = false;
  bool startBroke = false;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 250), vsync: this)
          ..addListener(() {
            setState(() {});
          });
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        startAnimation = true;
      });
    });
    Future.delayed(Duration(milliseconds: 700), () {
      _animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ErrorText(),
            SizedBox(
              width: 641,
              height: 310,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  AnimatedPositioned(
                    duration: duration,
                    top: 0,
                    left: startAnimation ? 0 : 50,
                    child: AnimatedOpacity(
                      opacity: startAnimation ? 1 : 0.3,
                      duration: duration,
                      child: SvgPicture.asset("assets/icons/Group 64.svg"),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: duration,
                    bottom: 0,
                    left: startAnimation ? 130 : 0,
                    child: AnimatedOpacity(
                      opacity: startAnimation ? 1 : 0,
                      duration: duration,
                      child: SizedBox(
                        height: 310,
                        width: 528,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              bottom: 7,
                              left: 230 + (_animationController.value * 90),
                              child: SvgPicture.asset(
                                "assets/icons/cycle_part_2.svg",
                                height: 142,
                                width: 142,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Transform.rotate(
                                angle: (_animationController.value * 15) *
                                    (pi / 180),
                                child: SvgPicture.asset(
                                  "assets/icons/cycle_part_1.svg",
                                  height: 287,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: SvgPicture.asset("assets/icons/line.svg"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
