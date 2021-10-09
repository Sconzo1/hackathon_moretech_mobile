import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_moretech_mobile/app/flashcards/guidecards.dart';

import '../top_level_providers.dart';

class MapPage extends ConsumerWidget {
  const MapPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final isCardGameActive = watch(isCardGameActiveProvider);

    return Container(
      child:
          isCardGameActive.state ? GuideCards() : Container(),
    );
  }
}
