import 'package:flutter/material.dart';
import 'package:review_request_dialog/src/review_dialog.dart';

import 'launch_count_repository.dart';

//任意のタイミングで出す場合（アプリ起動回数は手動で計算）
Future<void> showReviewRequestDialogWithLaunchCount({
  int launchCountIntervals = 5,
  required BuildContext context,
  required String iOSAppStoreId,
  required int launchCount,
  bool isIncrement = false,
  Color? backgroundColor,
  String? customTitle,
  String? customDesc,
}) async {
  final isNoMoreDisplay = await LaunchCountRepository.isNoMoreDisplay();
  if (isNoMoreDisplay ||
      !_isDialogDisplay(
          isIncrement, launchCountIntervals, launchCount)) return;
  ReviewDialog.show(
    context: context,
    backgroundColor: backgroundColor,
    iOSAppStoreId: iOSAppStoreId,
  );
}

//アプリ起動回数をこのパッケージで管理したい場合
Future<void> setLaunchCount(int launchCount) async {
  await LaunchCountRepository.setLaunchCount(launchCount);
}

Future<int> getLaunchCount() async {
  return await LaunchCountRepository.getLaunchCount();
}

//アプリ起動時に出す場合（アプリ起動回数を自動計算）
Future<void> showReviewRequestDialogInAppLaunch({
  int launchCountIntervals = 5,
  required BuildContext context,
  required String iOSAppStoreId,
  bool isIncrement = false,
  Color? backgroundColor,
  String? customTitle,
  String? customDesc,
}) async {
  final launchCountBeforeChange = await LaunchCountRepository.getLaunchCount();
  int launchCountAfterChange =
      await LaunchCountRepository.setLaunchCount(launchCountBeforeChange + 1);
  print("launchCountAfterChange: $launchCountAfterChange");

  final isNoMoreDisplay = await LaunchCountRepository.isNoMoreDisplay();

  if (isNoMoreDisplay ||
      !_isDialogDisplay(
          isIncrement, launchCountIntervals, launchCountAfterChange)) return;

  ReviewDialog.show(
    context: context,
    backgroundColor: backgroundColor,
    iOSAppStoreId: iOSAppStoreId,
  );
}

bool _isDialogDisplay(
    bool isIncrement, int launchCountIntervals, int launchCountAfterChange) {
  if (!isIncrement) {
    return launchCountAfterChange % launchCountIntervals == 0;
  }

  final sequences = _createInfiniteSequences(launchCountIntervals).toList();
  print("sequences: $sequences");
  return sequences.contains(launchCountAfterChange);
}

/*
* Generatorで無限数列作成
* https://dart.dev/language/functions#generators
*
* ・Synchronous generator: Returns an Iterable object.
* ・Asynchronous generator: Returns a Stream object.
* */
Iterable<int> _createInfiniteSequences(int launchCountIntervals) sync* {
  int i = 0;
  int holdValue = 0;
  while (true) {
    /*
    * 等差数列的に増分させるか？(isIncrement）
    * launchCountIntervals = 5の場合
    * １回目：5，２回目：10（5+5*1）、3回目：20（10+5*2）、4回目：35（20+5*3）、
    * 以降は前回＋5*3足していく
    * */
    final incrementValue =
        (i <= 3) ? i * launchCountIntervals : 3 * launchCountIntervals;
    holdValue = holdValue + incrementValue;
    yield holdValue;
    i++;
  }
}
