import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:heart/common_utils/icons.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/image_post_card_provider/image_post_card_icon_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:provider/provider.dart';

class DetailedComments extends StatefulWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const DetailedComments(
      {super.key, required this.dimension, required this.styles});

  @override
  State<DetailedComments> createState() => _DetailedCommentsState();
}

class _DetailedCommentsState extends State<DetailedComments> {
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
    final like = Provider.of<ImagePostCardIconProvider>(context, listen: true);
    return Padding(
      padding: EdgeInsets.only(
        left: widget.dimension.width * 0.02,
        bottom: widget.dimension.width * 0.006,
        right: widget.dimension.width * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
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
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: widget.styles.commentFontSize,
                                  ),
                        )
                      : TextSpan(
                          children: [
                            TextSpan(
                              text: flag ? "$first $second" : first,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
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
          ),
          InkWell(
            onTap: () {
              like.updateLike();
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: widget.dimension.width * 0.032,
              ),
              child: like.isLikeEnabled
                  ? Iconify(
                      AppIcons.like,
                    )
                  : Iconify(
                      AppIcons.like_border,
                      color: Theme.of(context).iconTheme.color,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
