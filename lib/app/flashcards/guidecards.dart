import "package:flutter/material.dart";
import 'package:swipable_stack/swipable_stack.dart';
import 'package:tcard/tcard.dart';

class GuideCards extends StatefulWidget {
  const GuideCards({Key? key}) : super(key: key);

  @override
  _GuideCardsState createState() => _GuideCardsState();
}

class _GuideCardsState extends State<GuideCards> {
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



  @override
  Widget build(BuildContext context) {

    List<Widget> guideCards = List.generate(
        guides.length, (index) => _buildGuideCard(guides[index]));

    return SafeArea(
      child: Center(
        child:
        TCard(
          size: Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.75),
          cards: guideCards,
          onForward: (index, info){
          },
          onEnd: (){
          },
        )
      ),
    );
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
                  // Icon(Icons.subdirectory_arrow_left_rounded, color: Color(0xffFFBD12),),
                  // Icon(Icons.subdirectory_arrow_right_rounded, color: Color(0xff7CE579)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String assetName) {
    return Image.asset("images/$assetName");
  }
}

class Guide {
  String title;
  String img;
  String text;

  Guide({required this.title, required this.img, required this.text});
}
