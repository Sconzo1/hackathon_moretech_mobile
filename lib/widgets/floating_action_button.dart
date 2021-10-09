import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:hackathon_moretech_mobile/app/top_level_providers.dart';
import 'package:hackathon_moretech_mobile/constants/pages_ids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final activePage = watch(activePageProvider);

    return FabCircularMenu(
        key: fabKey,
        alignment: Alignment.bottomRight,
        ringColor: Colors.blue.withAlpha(65),
        ringDiameter: 350.0,
        ringWidth: 100.0,
        fabSize: 64.0,
        fabElevation: 8.0,
        fabIconBorder: CircleBorder(),
        fabColor: Colors.white,
        fabOpenIcon: Icon(Icons.menu, color: Colors.blue),
        fabCloseIcon: Icon(Icons.close, color: Colors.blue),
        fabMargin: const EdgeInsets.all(24.0),
        animationDuration: const Duration(milliseconds: 500),
        animationCurve: Curves.easeInOutCirc,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.map,
            ),
            iconSize: 32,
            color: Color(0xff14315C),
            highlightColor: Colors.transparent,
            splashColor: Colors.blue[200],
            onPressed: () {
              activePage.state = MAP_PAGE;
              fabKey.currentState!.close();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.home,
            ),
            iconSize: 32,
            color: Color(0xff14315C),
            highlightColor: Colors.transparent,
            splashColor: Colors.blue[200],
            onPressed: () {
              activePage.state = CAMP_PAGE;
              fabKey.currentState!.close();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.backpack,
            ),
            iconSize: 32,
            color: Color(0xff14315C),
            highlightColor: Colors.transparent,
            splashColor: Colors.blue[200],
            onPressed: () {
              activePage.state = INVENTORY_PAGE;
              fabKey.currentState!.close();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
            ),
            iconSize: 36,
            color: Color(0xff14315C),
            highlightColor: Colors.transparent,
            splashColor: Colors.blue[200],
            onPressed: () {
              activePage.state = PROFILE_PAGE;
              fabKey.currentState!.close();
            },
          ),
        ]);
  }
}
