import 'package:flutter/material.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_body/comments/direct_comments.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_body/comments/replied_comments.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class CommentsBottomSheetBody extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const CommentsBottomSheetBody(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: dimension.width * 0.02,
          right: dimension.width * 0.02,
          bottom: dimension.width * 0.02,
        ),
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  DirectComments(
                    isAuthorCommented: false,
                    dimension: dimension,
                    styles: styles,
                  ),
                  RepliedComments(
                    isAuthorReplied: false,
                    dimension: dimension,
                    styles: styles,
                  ),
                  RepliedComments(
                    isAuthorReplied: true,
                    dimension: dimension,
                    styles: styles,
                  ),
                  RepliedComments(
                    isAuthorReplied: false,
                    dimension: dimension,
                    styles: styles,
                  ),
                  DirectComments(
                    isAuthorCommented: true,
                    dimension: dimension,
                    styles: styles,
                  ),
                  DirectComments(
                    isAuthorCommented: false,
                    dimension: dimension,
                    styles: styles,
                  ),
                  RepliedComments(
                    isAuthorReplied: true,
                    dimension: dimension,
                    styles: styles,
                  ),
                  DirectComments(
                    isAuthorCommented: true,
                    dimension: dimension,
                    styles: styles,
                  ),
                  DirectComments(
                    isAuthorCommented: false,
                    dimension: dimension,
                    styles: styles,
                  ),
                  RepliedComments(
                    isAuthorReplied: true,
                    dimension: dimension,
                    styles: styles,
                  ),
                ],
              );
            }));
  }
}
