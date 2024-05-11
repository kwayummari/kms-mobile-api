import 'package:gugu/src/screens/introduction/slides.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<Slide> slides = [
    Slide(
      backgroundColor: AppConst.primary,
      centerText:
          'Sign up for free to access our Engineering courses and start learning today.',
      image: 'assets/2.jpg',
    ),
    Slide(
      backgroundColor: AppConst.primary,
      centerText: 'Learn from anywhere Download Course to Study offline',
      image: 'assets/1.jpg',
    ),
    Slide(
      backgroundColor: AppConst.primary,
      centerText:
          'Discover new Skills and Advance your Skills with our courses',
      image: 'assets/3.jpg',
    ),
  ];
  Color activeColor = Color.fromARGB(255, 0, 10, 150);
  Color inactiveColor = Color.fromARGB(255, 255, 255, 255);
  double sizeIndicator = 20;

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
        isShowNextBtn: false,
        isShowPrevBtn: false,
        isShowSkipBtn: false,
        isShowDoneBtn: false,
        isScrollable: true,
        curveScroll: Curves.easeInOutCubicEmphasized,
        scrollPhysics: const BouncingScrollPhysics(),
        indicatorConfig: IndicatorConfig(
          sizeIndicator: sizeIndicator,
          indicatorWidget: Container(
            width: sizeIndicator,
            height: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: inactiveColor),
          ),
          activeIndicatorWidget: Container(
            width: sizeIndicator,
            height: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: activeColor),
          ),
          spaceBetweenIndicator: 10,
          typeIndicatorAnimation: TypeIndicatorAnimation.sliding,
        ),
        listCustomTabs: slides);
  }
}
