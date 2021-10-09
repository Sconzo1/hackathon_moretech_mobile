import 'package:hackathon_moretech_mobile/app/top_level_providers.dart';
import 'package:hackathon_moretech_mobile/constants/pages_ids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final bottomNavIndex = watch(bottomNavIndexProvider);

    return FloatingActionButton(
      child: Text(
        'VТБ',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        bottomNavIndex.state = TODO_PAGE;
      },
    );
  }
}
