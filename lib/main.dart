import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_moretech_mobile/app/flashcards/flashcards.dart';
import 'package:hackathon_moretech_mobile/app/top_level_providers.dart';
import 'package:hackathon_moretech_mobile/constants/pages_ids.dart';
import 'package:hackathon_moretech_mobile/widgets/bottom_navigation_bar.dart';
import 'package:hackathon_moretech_mobile/widgets/floating_action_button.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyNavigation(),
    );
  }
}

class MyNavigation extends ConsumerWidget {
  const MyNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final bottomNavIndex = watch(bottomNavIndexProvider);

    Widget? _getBody() {
      switch (bottomNavIndex.state) {
        case TESTS_PAGE:
          {
            //return TestsPage();
            return Container();
          }
        case CHAT_PAGE:
          {
            return Container();
          }
        case GUIDES_PAGE:
          {
            return Container();
          }
        case PROFILE_PAGE:
          {
            return Container();
          }
        case TODO_PAGE:
          {
            return FlashCardsPage();
          }
      }
    }


    return Scaffold(
      body: _getBody(),
      floatingActionButton: MyFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyNavigationBar(),
    );

  }
}
