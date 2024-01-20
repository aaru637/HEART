import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../../common_utils/icons.dart';
import '../../../../../providers/image_post_card_provider/image_post_card_icon_provider.dart';

class DirectComments extends StatefulWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  final bool isAuthorCommented;
  const DirectComments(
      {super.key,
      required this.isAuthorCommented,
      required this.dimension,
      required this.styles});

  @override
  State<DirectComments> createState() => _DirectCommentsState();
}

class _DirectCommentsState extends State<DirectComments> {
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
        right: widget.dimension.width * 0.02,
        bottom: widget.dimension.width * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(
              "assets/images/BEN.jpg",
            ),
          ),
          SizedBox(
            width: widget.dimension.width * 0.032,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: widget.dimension.width * 0.35,
                      child: Text(
                        "dhineshkumar_d_2002sgr edrg dhd fhdfhdgh dfghdgfhfg",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontSize: widget.styles.contentFontSize,
                                ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: widget.dimension.width * 0.02,
                    ),
                    Text(
                      "1w",
                      style: TextStyle(
                        fontFamily: "TiltWarp",
                        fontSize: widget.styles.subContentFontSize,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: widget.dimension.width * 0.012,
                    ),
                    widget.isAuthorCommented
                        ? Container(
                            width: 5,
                            height: 5,
                            margin: EdgeInsets.only(
                              top: widget.dimension.width * 0.012,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      width: widget.dimension.width * 0.012,
                    ),
                    widget.isAuthorCommented
                        ? Text(
                            "Author",
                            style: TextStyle(
                              fontFamily: "TiltWarp",
                              fontSize: widget.styles.subContentFontSize,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : Container(),
                  ],
                ),
                SizedBox(
                  height: widget.dimension.height * 0.01,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      !updateText(
                              "jdfn slfg dfgjk dhkjgh d d d d d d d d d d d d ")
                          ? TextSpan(
                              text: first,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: widget.styles.commentFontSize,
                                  ),
                            )
                          : TextSpan(
                              children: [
                                TextSpan(
                                  text: flag ? "$first $second" : first,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: widget.styles.commentFontSize,
                                      ),
                                ),
                                TextSpan(
                                  text: flag ? " ... less" : " ... more",
                                  style: TextStyle(
                                    fontFamily: "TiltWarp",
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
                SizedBox(
                  height: widget.dimension.height * 0.01,
                ),
                Text(
                  "Reply",
                  style: TextStyle(
                    fontFamily: "TiltWarp",
                    fontSize: widget.styles.loginFontSize,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              Padding(
                padding: EdgeInsets.only(
                  left: widget.dimension.width * 0.032,
                  top: widget.dimension.width * 0.02,
                ),
                child: Text(
                  "10",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: widget.styles.subContentFontSize,
                      ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
