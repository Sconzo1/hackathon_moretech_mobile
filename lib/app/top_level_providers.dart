import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_moretech_mobile/constants/pages_ids.dart';
import 'package:hackathon_moretech_mobile/constants/pages_names.dart';

final userNameProvider = Provider((ref) => 'Алексей Кудашкин');
final userEmailProvider = Provider((ref) => 'avk224@tpu.ru');
final userPhoneProvider = Provider((ref) => '+7 (908) 954-76-94');

final userAvatarProvider = StateProvider((ref) => 'assets/emoj.png');

final userSexProvider = StateProvider((ref) => 'м');
final userAgeProvider = StateProvider((ref) => 35);
final userIncomeProvider = StateProvider((ref) => 'средний');
final userMarriageStatusProvider = StateProvider((ref) => 'есть дети');

final userCompleteIntroductionProvider = StateProvider((ref) => true);

final activePageProvider = StateProvider<int>((ref) {
  return ref.watch(userCompleteIntroductionProvider).state
      ? MAP_PAGE
      : INTRODUCTION_PAGE;
});
