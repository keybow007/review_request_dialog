import 'review_request_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class ReviewRequestLocalizationsEn extends ReviewRequestLocalizations {
  ReviewRequestLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Thanks for your support!';

  @override
  String get desc => 'We\'re always looking for ways to make our app better. \n\nYour rating and review help us a lot. \n\nThanks for using our app!';

  @override
  String get goReview => 'Review';

  @override
  String get cancel => 'Cancel';

  @override
  String get noMoreDisplay => 'Don\'t show again';
}
