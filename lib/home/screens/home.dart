import 'package:flutter/material.dart';
import 'package:heart/home/screens/following/following_posts.dart';
import 'package:heart/home/screens/recent/recent_posts.dart';
import 'package:heart/home/screens/trending/trending_posts.dart';
import 'package:heart/home/widgets/app_bar/home_heading.dart';
import 'package:heart/home/widgets/story/story.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:provider/provider.dart';
import '../../common_utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool recent = true;
  bool following = false;
  bool trending = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimension = Provider.of<DimensionProvider>(context, listen: true);
    final styles = Provider.of<HomeTextStyleProvider>(context, listen: true);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: dimension.height * 0.06,
        ),
        HomeHeading(
          dimension: dimension,
          styles: styles,
        ),
        SizedBox(
          height: dimension.height * 0.02,
        ),
        Container(
          margin: EdgeInsets.only(
            left: dimension.width * 0.03,
            right: dimension.width * 0.03,
          ),
          height: dimension.height * 0.16,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Story(
                index: index,
                dimension: dimension,
                styles: styles,
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: dimension.width * 0.04,
            right: dimension.width * 0.04,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(
                    () {
                      recent = true;
                      following = false;
                      trending = false;
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(
                    dimension.width * 0.03,
                  ),
                  width: dimension.width * 0.25,
                  decoration: BoxDecoration(
                    color: recent
                        ? AppColors.loginButtonColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Recent",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "TiltWarp",
                      letterSpacing: 1,
                      fontSize: styles.tabFontSize,
                      fontWeight: FontWeight.bold,
                      color: recent
                          ? Colors.white
                          : Theme.of(context).iconTheme.color!,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      recent = false;
                      following = true;
                      trending = false;
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(
                    dimension.width * 0.03,
                  ),
                  width: dimension.width * 0.25,
                  decoration: BoxDecoration(
                    color: following
                        ? AppColors.loginButtonColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Following",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "TiltWarp",
                      letterSpacing: 1,
                      fontSize: styles.tabFontSize,
                      fontWeight: FontWeight.bold,
                      color: following
                          ? Colors.white
                          : Theme.of(context).iconTheme.color!,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      recent = false;
                      following = false;
                      trending = true;
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(
                    dimension.width * 0.03,
                  ),
                  width: dimension.width * 0.25,
                  decoration: BoxDecoration(
                    color: trending
                        ? AppColors.loginButtonColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Trending",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "TiltWarp",
                      letterSpacing: 1,
                      fontSize: styles.tabFontSize,
                      fontWeight: FontWeight.bold,
                      color: trending
                          ? Colors.white
                          : Theme.of(context).iconTheme.color!,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        recent
            ? const RecentPosts()
            : (following ? const FollowingPosts() : const TrendingPosts()),
      ],
    );
  }
}
