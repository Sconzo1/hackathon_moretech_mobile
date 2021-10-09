import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_moretech_mobile/app/flashcards/FlashCard.dart';
import 'package:tcard/tcard.dart';

class FlashCardsPage extends StatefulWidget {
  const FlashCardsPage({Key? key}) : super(key: key);

  @override
  _FlashCardsPageState createState() => _FlashCardsPageState();
}

class _FlashCardsPageState extends State<FlashCardsPage> {
  final questions = [
    FlashCard(
        front: "Что Клар украл у Клары во время инфляции в 1988г?",
        back: "Кораллы"),
    FlashCard(front: "Зимой и летом одним цветом, что это?", back: "Солнце"),
    FlashCard(front: "Самый лучший банк на свете", back: "ВТБ"),
    FlashCard(front: "Самый лучший банк на свете", back: "ВТБ"),
    FlashCard(front: "Самый лучший банк на свете", back: "ВТБ"),
  ];

  static List<T> _map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int _current = 0;
  bool _isEnd = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = List.generate(
        questions.length, (index) => _renderContent(index, questions[index]));

    return SafeArea(
      child: Center(
        child: Container(
          color: Colors.grey[100],
          padding: EdgeInsets.only(top: 30),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${_current + 1} / ${questions.length}",
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _map(questions, (index, assetName) {
                      return Container(
                        margin: EdgeInsets.only(left: 5),
                        width: 50,
                        height: 2,
                        decoration: BoxDecoration(
                            color: _current == index
                                ? Colors.blueAccent
                                : Colors.grey[500]),
                      );
                    }),
                  ),
                ),
                !_isEnd
                    ? TCard(
                        size: Size(350, 450),
                        cards: cards,
                        onForward: (index, info) {
                          setState(() {
                            _current++;
                          });
                          print("OnForward $index ${info.direction}");
                        },
                        onEnd: () {
                          setState(() {
                            _current = questions.length - 1;
                            _isEnd = true;
                          });
                          print("OnEnd");
                        },
                      )
                    : Card(
                        elevation: 0.0,
                        margin: const EdgeInsets.only(
                            left: 32.0, right: 32.0, top: 10.0, bottom: 0.0),
                        color: Color(0x00000000),
                        child: _getFlipCardContent(-1, "Вы все прошли"),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 48,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xffFFBD12),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                      ),
                      child: Center(
                          child: Text(
                        '2',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                    ),
                    Container(
                      width: 48,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xff7CE579),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                      ),
                      child: Center(
                          child: Text(
                        '1',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }

  _renderContent(index, FlashCard question) {
    return Card(
      elevation: 0.0,
      color: Color(0x00000000),
      child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          speed: 800,
          onFlipDone: (status) {
            print("$index: $status");
          },
          front: _getFlipCardContent(index, question.front),
          back: _getFlipCardContent(index, question.back)),
    );
  }

  _getFlipCardContent(index, text) {
    double cardHeight = 450;
    double cardWidth = 300;

    return Container(
      padding: EdgeInsets.all(8),
      height: cardHeight,
      width: cardWidth,
      decoration: const BoxDecoration(
          color: Color(0xFFffffff),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(color: Color(0xffc9c9c9), spreadRadius: 3),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              )),
        ],
      ),
    );
  }
}
