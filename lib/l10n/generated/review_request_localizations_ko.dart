import 'review_request_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class ReviewRequestLocalizationsKo extends ReviewRequestLocalizations {
  ReviewRequestLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get title => '응원해주셔서 감사합니다!';

  @override
  String get desc => '저희 앱을 이용해주셔서 감사합니다! 앱이 마음에 드셨다면, 별점 부탁드립니다. \\n\\n 여러분의 따뜻한 리뷰는 앞으로의 앱 개발에 큰 힘이 됩니다! \\n\\n 또한, 의견이나 건의사항도 부담 없이 알려주세요. 더 나은 앱을 만들기 위해 노력하겠습니다. \\n 감사합니다.';

  @override
  String get goReview => '평가하기';

  @override
  String get cancel => '취소';

  @override
  String get noMoreDisplay => '다음부터 보이지 않음';
}
