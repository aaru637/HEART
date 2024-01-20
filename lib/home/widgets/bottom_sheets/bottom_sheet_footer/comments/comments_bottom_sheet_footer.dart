import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import '../../../../../common_utils/icons.dart';

class CommentsBottomSheetFooter extends StatefulWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const CommentsBottomSheetFooter(
      {super.key, required this.dimension, required this.styles});

  @override
  State<CommentsBottomSheetFooter> createState() =>
      _CommentsBottomSheetFooterState();
}

class _CommentsBottomSheetFooterState extends State<CommentsBottomSheetFooter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.dimension.width * 0.023,
        ),
        const Text("Emoji's"),
        const Divider(
          color: Colors.grey,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: widget.dimension.width * 0.02,
            right: widget.dimension.width * 0.02,
            bottom: widget.dimension.width * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage("assets/images/BEN.jpg"),
              ),
              SizedBox(
                width: widget.dimension.width * 0.70,
                child: TextField(
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: widget.styles.contentFontSize,
                        color: Theme.of(context).cardColor,
                      ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: widget.dimension.width * 0.05,
                      right: widget.dimension.width * 0.05,
                      top: widget.dimension.width * 0.002,
                      bottom: widget.dimension.width * 0.002,
                    ),
                    hintText: "Add a comment for dhineshkumar_d_2002",
                    hintStyle:
                        Theme.of(context).textTheme.labelMedium!.copyWith(
                              fontSize: widget.styles.contentFontSize,
                            ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: widget.dimension.width * 0.03,
                ),
                child: Iconify(
                  AppIcons.send,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
