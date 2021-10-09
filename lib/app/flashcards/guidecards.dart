import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:radar_chart/radar_chart.dart';
import 'package:tcard/tcard.dart';

import '../top_level_providers.dart';

class GuideCards extends ConsumerWidget {

  final guides = [
    Guide(
        title: "Деревья знают это",
        img: "trees_know.png",
        text: "На бирже торгуются различные ценные бумаги, которые выпускают корпорации и даже государства." +
            "\n\nОдним из самых распространненых инструментов это будет акция." +
            "\n\nАкция — это ценная бумага, которую выпускает акционерное общество, другими словами — компания-эмитент."),
    Guide(
        title: "Деревья знают это",
        img: "trees_know.png",
        text: "На бирже торгуются различные ценные бумаги, которые выпускают корпорации и даже государства." +
            "\n\nОдним из самых распространненых инструментов это будет акция." +
            "\n\nАкция — это ценная бумага, которую выпускает акционерное общество, другими словами — компания-эмитент."),
    Guide(
        title: "Деревья знают это",
        img: "trees_know.png",
        text: "На бирже торгуются различные ценные бумаги, которые выпускают корпорации и даже государства." +
            "\n\nОдним из самых распространненых инструментов это будет акция." +
            "\n\nАкция — это ценная бумага, которую выпускает акционерное общество, другими словами — компания-эмитент."),
  ];


  List<double> values1 = [0.4, 0.8, 0.65, 0.55, 0.2];

  @override
  Widget build(BuildContext context, watch) {
    final isCardGameActive = watch(isCardGameActiveProvider);
    final isCardGameFinished = watch(isCardGameFinishedProvider);
    final rememberedCards = watch(rememberedCardsProvider);
    final notRememberedCards = watch(notRememberedCardsProvider);

    Widget _buildImage(String assetName) {
      return Image.asset("images/$assetName");
    }

    _buildGuideCard(Guide card) {
      return Container(
        width: 300,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Color(0xffe9e9e9)),
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Container(
          padding: EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 20),
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Color(0xff89B5F7)),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                card.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              _buildImage(card.img),
              Text(
                card.text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildImage("swipe_left.png"),
                    _buildImage("swipe_right.png"),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    _buildFinishCard() {
      return GestureDetector(
        onHorizontalDragEnd: (details) {
          print("Closing CardGame");
          isCardGameActive.state = false;
        },
        child: Container(
          width: 300,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Color(0xffe9e9e9)),
            color: Color(0xffffffff),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Container(
            padding: EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 20),
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: Color(0xff75D15E)),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Деревья знают это",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "--ПРОЙДЕНО--",
                    style: TextStyle(color: Color(0xff75D15E), fontSize: 22),
                  ),
                ),
                RadarChart(
                  length: 5,
                  radius: 100,
                  initialAngle: 3.14 / 9,
                  backgroundColor: Color(0xffFFBD12).withOpacity(0.2),
                  borderStroke: 2,
                  borderColor: Colors.white,
                  radialStroke: 2,
                  radialColor: Colors.white,
                  radars: [
                    RadarTile(
                      values: values1,
                      borderStroke: 3,
                      borderColor: Color(0xffFFBD12),
                      backgroundColor: Colors.yellow.withOpacity(0.4),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Вы прокачали навык",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Text(
                  "ОСАДА",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Вы можете повалить не только монстра, но и рынок акций!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    };


    List<Widget> guideCards =
    List.generate(guides.length, (index) => _buildGuideCard(guides[index]));


    return SafeArea(
      child: Center(
        child: !isCardGameFinished.state
            ? TCard(
                size: Size(MediaQuery.of(context).size.width * 0.9,
                    MediaQuery.of(context).size.height * 0.75),
                cards: guideCards,
                onForward: (index, info) {
                  if (info.direction == SwipDirection.Left){
                    notRememberedCards.state++;
                  } else {
                    rememberedCards.state ++;
                  }
                },
                onEnd: () {
                  print("OnEnd1");
                  isCardGameFinished.state = true;
                  // setState(() {
                  //   isFinished = true;
                  // });
                },
              )
            : _buildFinishCard()
      ),
    );
  }


}

class Guide {
  String title;
  String img;
  String text;

  Guide({required this.title, required this.img, required this.text});
}
