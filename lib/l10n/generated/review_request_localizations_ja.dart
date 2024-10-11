import 'review_request_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class ReviewRequestLocalizationsJa extends ReviewRequestLocalizations {
  ReviewRequestLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get title => '応援よろしくお願いいたします！';

  @override
  String get desc => 'いつもご利用いただきありがとうございます！もしアプリを気に入っていただけましたら、ぜひ高評価をお願いします。\n\n皆さまの温かいレビューが、今後のアプリ開発の励みになります！\n\nまた、ご意見やご感想も是非お聞かせください。より良いアプリを目指して改善に活用させていただきます。\nよろしくお願い致します。';

  @override
  String get goReview => 'レビューする';

  @override
  String get cancel => 'キャンセル';

  @override
  String get noMoreDisplay => '次回以降表示しない';
}
