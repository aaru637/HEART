import 'package:flutter/material.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_body/share/share_bottom_sheet_body.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_footer/share/share_bottom_sheet_footer.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

import 'bottom_sheet_heading/share/share_bottom_sheet_heading.dart';

class ShareBottomSheet extends StatefulWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ShareBottomSheet(
      {super.key, required this.dimension, required this.styles});

  @override
  State<ShareBottomSheet> createState() => _ShareBottomSheetState();
}

class _ShareBottomSheetState extends State<ShareBottomSheet> {
  TextEditingController search = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    search.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ShareBottomSheetHeading(
          dimension: widget.dimension,
          styles: widget.styles,
          search: search,
        ),
        SizedBox(
          height: widget.dimension.height * 0.012,
        ),
        Expanded(
          child: ShareBottomSheetBody(
            dimension: widget.dimension,
            styles: widget.styles,
          ),
        ),
        SizedBox(
          height: widget.dimension.height * 0.15,
          child: ShareBottomSheetFooter(
            dimension: widget.dimension,
            styles: widget.styles,
          ),
        ),
      ],
    );
  }
}
