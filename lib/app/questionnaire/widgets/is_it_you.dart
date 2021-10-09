import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../top_level_providers.dart';
import '../questionnaire_providers.dart';

class IsItYou extends ConsumerWidget {
  const IsItYou({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final activePage = watch(activeQuestionnairePageProvider);
    final globalActivePage = watch(activePageProvider);

    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 32)),
          Text(
            'Кажется, я где-то вас видел.',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.only(top: 16)),
          Text(
            'Мы знакомы?',
            style: TextStyle(fontSize: 18),
          ),
          Padding(padding: EdgeInsets.only(top: 26)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/emoj.png',
                scale: 1.3,
              ),
              Image.asset('assets/emoj.png'),
              Image.asset('assets/emoj.png', scale: 1.3),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 48)),
          OutlinedButton(
              onPressed: () {
                globalActivePage.state = 1;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 106, vertical: 15),
                child: Text(
                  'Да, это я',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              )),
          Padding(padding: EdgeInsets.only(top: 20)),
          OutlinedButton(
              onPressed: () {
                activePage.state = 2;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                child: Text(
                  'Нет, ты с кем-то меня спутал',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              )),
        ],
      ),
    );
  }
}
