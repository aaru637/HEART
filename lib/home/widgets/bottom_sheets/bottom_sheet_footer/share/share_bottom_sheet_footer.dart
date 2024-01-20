import 'package:flutter/material.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_footer/share/share_bottom_sheet_footer_add_story.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_footer/share/share_bottom_sheet_footer_copy_link.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_footer/share/share_bottom_sheet_footer_download.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_footer/share/share_bottom_sheet_footer_facebook.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_footer/share/share_bottom_sheet_footer_messenger.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_footer/share/share_bottom_sheet_footer_send.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_footer/share/share_bottom_sheet_footer_sms.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_footer/share/share_bottom_sheet_footer_whatsapp.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class ShareBottomSheetFooter extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ShareBottomSheetFooter(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ShareBottomSheetFooterAddStory(
            dimension: dimension,
            styles: styles,
          );
        } else if (index == 1) {
          return ShareBottomSheetFooterDownload(
            dimension: dimension,
            styles: styles,
          );
        } else if (index == 2) {
          return ShareBottomSheetFooterSend(
            dimension: dimension,
            styles: styles,
          );
        } else if (index == 3) {
          return ShareBottomSheetFooterCopyLink(
            dimension: dimension,
            styles: styles,
          );
        } else if (index == 4) {
          return ShareBottomSheetFooterSMS(
            dimension: dimension,
            styles: styles,
          );
        } else if (index == 5) {
          return ShareBottomSheetFooterMessenger(
            dimension: dimension,
            styles: styles,
          );
        } else if (index == 6) {
          return ShareBottomSheetFooterWhatsapp(
            dimension: dimension,
            styles: styles,
          );
        } else {
          return ShareBottomSheetFooterFacebook(
            dimension: dimension,
            styles: styles,
          );
        }
      },
    );
  }
}
