import 'dart:io';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import '../l10n/generated/review_request_localizations.dart';

class ReviewRequestButton extends StatelessWidget {
  final String iOSAppStoreId;

  const ReviewRequestButton({
    Key? key,
    required this.iOSAppStoreId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary),
        onPressed: () {
          _reviewRequest(context);
        },
        child: Text(
          ReviewRequestLocalizations.of(context).goReview,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _reviewRequest(BuildContext context) async {

    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      if (Platform.isIOS) {
        //IphoneだけストアのID必要,AppStoreConnectの一般ーアプリ情報ーAppleIdからコピペ
        inAppReview.openStoreListing(appStoreId: iOSAppStoreId);
      } else {
        inAppReview.openStoreListing();
      }
    }
  }
}
