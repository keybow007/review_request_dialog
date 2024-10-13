import 'package:flutter/material.dart';
import 'package:review_request_dialog/src/review_dialog.dart';

import 'launch_count_repository.dart';

//For manually triggered dialogs (app launch count is calculated manually)
Future<void> showReviewRequestDialogWithLaunchCount({
  int launchCountIntervals = 7,
  required BuildContext context,
  required String iOSAppStoreId,
  required int launchCount,
  bool isIncrement = true,
  Color? backgroundColor,
  String? customTitle,
  String? customDesc,
  bool noMoreDisplayEnabled = true,
}) async {
  final isNoMoreDisplay = await LaunchCountRepository.isNoMoreDisplay();
  if (isNoMoreDisplay ||
      !_isDialogDisplay(isIncrement, launchCountIntervals, launchCount)) return;
  ReviewRequestDialog.show(
    context: context,
    backgroundColor: backgroundColor,
    iOSAppStoreId: iOSAppStoreId,
    noMoreDisplayEnabled: noMoreDisplayEnabled,
  );
}

//In the case of wanting to manage the app launch count within this package
Future<void> setLaunchCount(int launchCount) async {
  await LaunchCountRepository.setLaunchCount(launchCount);
}

Future<int> getLaunchCount() async {
  return await LaunchCountRepository.getLaunchCount();
}

Future<void> showReviewRequestLaunchCountAutoIncrement({
  int launchCountIntervals = 7,
  required BuildContext context,
  required String iOSAppStoreId,
  bool isIncrement = true,
  Color? backgroundColor,
  String? customTitle,
  String? customDesc,
  bool noMoreDisplayEnabled = true,
}) async {
  await showReviewRequestDialogInAppLaunch(
    launchCountIntervals: launchCountIntervals,
    context: context,
    iOSAppStoreId: iOSAppStoreId,
    isIncrement: isIncrement,
    backgroundColor: backgroundColor,
    customTitle: customTitle,
    customDesc: customDesc,
    noMoreDisplayEnabled: noMoreDisplayEnabled,
  );
}

//When displaying a dialog on app launch (automatically calculating the number of app launches)
Future<void> showReviewRequestDialogInAppLaunch({
  int launchCountIntervals = 7,
  required BuildContext context,
  required String iOSAppStoreId,
  bool isIncrement = true,
  Color? backgroundColor,
  String? customTitle,
  String? customDesc,
  bool noMoreDisplayEnabled = true,
}) async {
  final launchCountBeforeChange = await LaunchCountRepository.getLaunchCount();
  int launchCountAfterChange =
      await LaunchCountRepository.setLaunchCount(launchCountBeforeChange + 1);

  final isNoMoreDisplay = await LaunchCountRepository.isNoMoreDisplay();

  print(
      "launchCountAfterChange: $launchCountAfterChange/ isNoMoreDisplay: $isNoMoreDisplay");

  if (isNoMoreDisplay ||
      !_isDialogDisplay(
          isIncrement, launchCountIntervals, launchCountAfterChange)) return;

  ReviewRequestDialog.show(
      context: context,
      backgroundColor: backgroundColor,
      iOSAppStoreId: iOSAppStoreId,
      noMoreDisplayEnabled: noMoreDisplayEnabled);
}

bool _isDialogDisplay(
    bool isIncrement, int launchCountIntervals, int launchCountAfterChange) {
  if (!isIncrement) {
    return launchCountAfterChange % launchCountIntervals == 0;
  }

  final sequences = _createSequences(
          launchCountIntervals: launchCountIntervals,
          launchCount: launchCountAfterChange)
      .toList();
  print("sequences: $sequences");
  return sequences.contains(launchCountAfterChange);
}

/*
* Infinite Sequence Creation with Generator
* https://dart.dev/language/functions#generators
*
* ・Synchronous generator: Returns an Iterable object.
* ・Asynchronous generator: Returns a Stream object.
*   => If you make it an infinite number sequence,
*      it will be “Out of Memory”, so you need to use launchCountAfterChange
*      to make it a finite number sequence.
* */
Iterable<int> _createSequences(
    {required int launchCountIntervals, required int launchCount}) sync* {
  int i = 0;
  int holdValue = 0;

  while (holdValue < launchCount) {
    /*
    * Isometrically incremental?(isIncrement）
    * if launchCountIntervals = 5
    * #１：5，#2：10（5+5*1）、#3：20（10+5*2）、#4：35（20+5*3）、
    * Thereafter, add +5*3 to the previous +5*3
    * */
    final incrementValue =
        (i <= 3) ? i * launchCountIntervals : 3 * launchCountIntervals;
    holdValue = holdValue + incrementValue;
    yield holdValue;
    i++;
  }
}
