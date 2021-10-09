import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_moretech_mobile/app/camp/camp_page.dart';
import 'package:hackathon_moretech_mobile/app/inventory/inventory_page.dart';
import 'package:hackathon_moretech_mobile/app/map/map_page.dart';
import 'package:hackathon_moretech_mobile/app/profile/profile_page.dart';
import 'package:hackathon_moretech_mobile/app/questionnaire/questionnaire_page.dart';
import 'package:hackathon_moretech_mobile/app/top_level_providers.dart';
import 'package:hackathon_moretech_mobile/constants/pages_ids.dart';
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
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(side: BorderSide(color: Color(0xff14315C))),
        ),
      ),
      home: MyNavigation(),
    );
  }
}

class MyNavigation extends ConsumerWidget {
  const MyNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final activePage = watch(activePageProvider);

    Widget? _getBody() {
      switch (activePage.state) {
        case INTRODUCTION_PAGE:
          {
            return QuestionnairePage();
          }
        case MAP_PAGE:
          {
            return MapPage();
          }
        case CAMP_PAGE:
          {
            return CampPage();
          }
        case PROFILE_PAGE:
          {
            return ProfilePage();
          }
        case INVENTORY_PAGE:
          {
            return InventoryPage();
          }
      }
    }


    return Scaffold(
      body: _getBody(),
      floatingActionButton: MyFloatingActionButton(),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //bottomNavigationBar: MyNavigationBar(),
    );

  }
}
