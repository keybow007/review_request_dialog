import 'review_request_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class ReviewRequestLocalizationsZh extends ReviewRequestLocalizations {
  ReviewRequestLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get title => '感谢您的支持！';

  @override
  String get desc => '感谢您一直使用我们的应用程序！如果您喜欢我们的应用程序，请给我们评分。\\n\\n 您的宝贵意见是我们继续开发应用程序的动力！\\n\\n 此外，欢迎您提出任何意见或建议。我们将利用您的反馈来改进应用程序，为您提供更好的体验。\\n 感谢您的支持！';

  @override
  String get goReview => '评价';

  @override
  String get cancel => '取消';

  @override
  String get noMoreDisplay => '不再显示';
}

/// The translations for Chinese, using the Han script (`zh_Hans`).
class ReviewRequestLocalizationsZhHans extends ReviewRequestLocalizationsZh {
  ReviewRequestLocalizationsZhHans(): super('zh_Hans');

  @override
  String get title => '感谢您的支持！';

  @override
  String get desc => '感谢您一直使用我们的应用程序！如果您喜欢我们的应用程序，请给我们评分。\\n\\n 您的宝贵意见是我们继续开发应用程序的动力！\\n\\n 此外，欢迎您提出任何意见或建议。我们将利用您的反馈来改进应用程序，为您提供更好的体验。\\n 感谢您的支持！';

  @override
  String get goReview => '评价';

  @override
  String get cancel => '取消';

  @override
  String get noMoreDisplay => '不再显示';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class ReviewRequestLocalizationsZhHant extends ReviewRequestLocalizationsZh {
  ReviewRequestLocalizationsZhHant(): super('zh_Hant');

  @override
  String get title => '感謝您的支持！';

  @override
  String get desc => '感謝您一直使用我們的應用程式！如果您喜歡我們的應用程式，請給我們評分。\\n\\n 您的寶貴意見是我們繼續開發應用程式的動力！\\n\\n 此外，歡迎您提出任何意見或建議。我們將利用您的回饋來改進應用程式，為您提供更好的體驗。\\n 感謝您的支持！';

  @override
  String get goReview => '評價';

  @override
  String get cancel => '取消';

  @override
  String get noMoreDisplay => '不再顯示';
}
