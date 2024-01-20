import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/on_boarding/controller/on_boarding_controller.dart';
import 'package:heart/on_boarding/utils/animation_strings.dart';
import 'package:heart/on_boarding/utils/text.dart';
import 'package:heart/on_boarding/widgets/on_boarding_get_started_button.dart';
import 'package:heart/on_boarding/widgets/on_boarding_navigation.dart';
import 'package:heart/on_boarding/widgets/on_boarding_next_button.dart';
import 'package:heart/on_boarding/widgets/on_boarding_page.dart';
import 'package:heart/on_boarding/widgets/on_boarding_skip.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/on_boarding_text_style_provider/on_boarding_text_style_provider.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = Get.put(OnBoardingController());
  bool skip = true;
  void updateState(int index) {
    controller.updatePageIndicator(index);
    if (controller.currentIndex == 2) {
      setState(() {
        skip = false;
      });
    } else {
      setState(() {
        skip = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dimension = Provider.of<DimensionProvider>(context, listen: true);
    final styles =
        Provider.of<OnBoardingTextStyleProvider>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable Page
          Padding(
            padding: EdgeInsets.all(dimension.width * 0.06),
            child: PageView(
              controller: controller.pageController,
              onPageChanged: updateState,
              children: [
                On_Boarding_Page(
                  animationString: On_Boarding_Animation_Strings.on_boarding_1,
                  title: On_Board_Text.on_boarding_text_1,
                  content: On_Board_Text.on_boarding_content_1,
                  dimension: dimension,
                ),
                On_Boarding_Page(
                  animationString: On_Boarding_Animation_Strings.on_boarding_2,
                  title: On_Board_Text.on_boarding_text_2,
                  content: On_Board_Text.on_boarding_content_2,
                  dimension: dimension,
                ),
                On_Boarding_Page(
                  animationString: On_Boarding_Animation_Strings.on_boarding_3,
                  title: On_Board_Text.on_boarding_text_3,
                  content: On_Board_Text.on_boarding_content_3,
                  dimension: dimension,
                ),
              ],
            ),
          ),

          !skip
              ? Container()
              : OnBoardingSkip(
                  dimension: dimension,
                  styles: styles,
                ),

          OnBoardingNavigation(
            dimension: dimension,
          ),

          !skip
              ? OnBoardingGetStartedButton(
                  dimension: dimension,
                  styles: styles,
                )
              : OnBoardingNextButton(
                  dimension: dimension,
                )
        ],
      ),
    );
  }
}
