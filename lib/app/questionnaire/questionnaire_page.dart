import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_moretech_mobile/app/questionnaire/questionnaire_providers.dart';
import 'package:hackathon_moretech_mobile/app/questionnaire/widgets/is_it_you.dart';
import 'package:hackathon_moretech_mobile/app/questionnaire/widgets/its_not_me.dart';

import '../top_level_providers.dart';

class QuestionnairePage extends ConsumerWidget {
  const QuestionnairePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final userAvatar = watch(userAvatarProvider);
    final activePage = watch(activeQuestionnairePageProvider);

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.red,
              child: Center(
                child: Container(
                  height: 200,
                  width: 130,
                  color: Colors.green,
                  child: Image.asset(userAvatar.state),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: activePage.state == 1 ? IsItYou() : ConfigureAvatarPage()),
        ],
      ),
    );
  }
}
