import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class Content extends StatefulWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const Content({super.key, required this.dimension, required this.styles});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  bool flag = false;
  String first = "";
  String second = "";

  bool updateText(String text) {
    if (text.length > 30) {
      first = text.substring(0, 30);
      second = text.substring(30);
      return true;
    } else {
      first = text;
      second = "";
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.dimension.width * 0.02,
        bottom: widget.dimension.width * 0.006,
        right: widget.dimension.width * 0.02,
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "dhineshkumar_d_2002  ",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: widget.styles.usernameFontSize,
                  ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print("Username text Clicked");
                },
            ),
            !updateText("jdfn slfg dfgjk dhkjgh dshg dsgsdfg dfs d")
                ? TextSpan(
                    text: first,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: widget.styles.commentFontSize,
                        ),
                  )
                : TextSpan(
                    children: [
                      TextSpan(
                        text: flag ? "$first $second" : first,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: widget.styles.commentFontSize,
                            ),
                      ),
                      TextSpan(
                        text: flag ? " ... less" : " ... more",
                        style: TextStyle(
                          fontFamily: "Poppins_SemiBold",
                          fontSize: widget.styles.commentFontSize,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(
                              () {
                                flag = !flag;
                              },
                            );
                          },
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
