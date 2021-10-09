import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_moretech_mobile/app/flashcards/guidecards.dart';
import 'package:hackathon_moretech_mobile/app/map/map_providers.dart';
import 'package:hackathon_moretech_mobile/app/minigames/chart_prediction/chart_game_page.dart';
import 'package:transition/transition.dart';

class MapPage extends ConsumerWidget {
  const MapPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final newPos = watch(newPosProvider);

    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/map.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          AnimatedPositioned(
            bottom: newPos.state[0] + 20,
            right: newPos.state[1] + 25,
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInBack,
            child: Container(
              width: 20,
              height: 50,
              color: Colors.redAccent,
            ),
          ),
          // level 1
          Positioned(
            bottom: 65,
            right: 85,
            child: InkWell(
              onTap: () {
                newPos.state = [65, 85];
              },
              child: Container(
                width: 80,
                height: 50,
                color: Colors.transparent,
              ),
            ),
          ),
          // level 2
          Positioned(
            bottom: 190,
            right: 145,
            child: InkWell(
              onTap: () async {
                newPos.state = [190, 150];
                final result = await Future.delayed(
                  const Duration(milliseconds: 1500),
                  () async {
                    return await Navigator.push(
                      context,
                      Transition(
                          child: ChartMinigame(),
                          transitionEffect: TransitionEffect.FADE),
                    );
                  },
                );
                print(result);
              },
              child: Container(
                width: 80,
                height: 50,
                color: Colors.transparent,
              ),
            ),
          ),
          //level 3
          Positioned(
            bottom: 365,
            right: 140,
            child: InkWell(
              onTap: () async {
                newPos.state = [365, 145];
                final result = await Future.delayed(
                  const Duration(milliseconds: 1500),
                      () async {
                    return await Navigator.push(
                      context,
                      Transition(
                          child: GuideCards(),
                          transitionEffect: TransitionEffect.FADE),
                    );
                  },
                );
              },
              child: Container(
                width: 80,
                height: 50,
                color: Colors.transparent,
              ),
            ),
          ),
          //level 4
          Positioned(
            bottom: 280,
            right: 280,
            child: InkWell(
              onTap: () {
                newPos.state = [285, 285];
              },
              child: Container(
                width: 80,
                height: 50,
                color: Colors.transparent,
              ),
            ),
          ),
          //level 5
          Positioned(
            bottom: 575,
            right: 315,
            child: InkWell(
              onTap: () {
                newPos.state = [575, 335];
              },
              child: Container(
                width: 80,
                height: 50,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
