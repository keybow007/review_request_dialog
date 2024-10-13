import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:review_request_dialog/src/five_star_row.dart';
import 'package:review_request_dialog/src/launch_count_repository.dart';
import 'package:review_request_dialog/src/review_request_button.dart';
import 'package:review_request_dialog/src/styles.dart';

import '../l10n/generated/review_request_localizations.dart';

class ReviewDialog {
  static Future<void> show({
    required BuildContext context,
    required String iOSAppStoreId,
    Color? backgroundColor,
    String? customTitle,
    String? customDesc,
    bool noMoreDisplayEnabled = true,
  }) async {
    bool isNoMoreDisplayChecked = false;

    AwesomeDialog(
      context: context,
      dismissOnBackKeyPress: false,
      dismissOnTouchOutside: false,
      dialogBackgroundColor:
          backgroundColor ?? Theme.of(context).dialogBackgroundColor,
      dialogType: DialogType.info,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: AutoSizeText(
              customTitle ?? ReviewRequestLocalizations.of(context).title,
              style: TextStyles.dialogTitle,
              maxLines: 1,
              minFontSize: 10,
            ),
          ),
          FiveStarRow(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              customDesc ?? ReviewRequestLocalizations.of(context).desc,
              style: TextStyles.dialogDesc,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ReviewRequestButton(
            iOSAppStoreId: iOSAppStoreId,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                ReviewRequestLocalizations.of(context).cancel,
              ),
            ),
          ),
          if (noMoreDisplayEnabled)
            StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      ReviewRequestLocalizations.of(context).noMoreDisplay,
                      style: TextStyles.dialogDesc,
                    ),
                    value: isNoMoreDisplayChecked,
                    onChanged: (bool? isChecked) async {
                      await LaunchCountRepository.setNoMoreDisplay(
                          isChecked ?? false);
                      setState(
                        () {
                          isNoMoreDisplayChecked = isChecked ?? false;
                        },
                      );
                    },
                  ),
                );
              },
            ),
        ],
      ),
    )..show();
  }
}
