import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

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
  ];

  static List<T> _map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int _current = 0;
  int counter = 2;

  @override
  Widget build(BuildContext context) {
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();

    return SafeArea(
      child: Center(
        child: Container(
          color: Colors.grey[100],
          padding: EdgeInsets.only(top: 40),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${_current + 1} / ${questions.length}",
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12, bottom: 50),
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
                SwipeableCardsSection(
                  cardController: _cardController,
                  context: context,
                  //add the first 3 cards
                  items: [
                    _renderContent(questions[0]),
                    _renderContent(questions[1]),
                    _renderContent(questions[2]),
                  ],
                  onCardSwiped: (dir, index, widget) {
                    //Add the next card
                    // if (counter < questions.length) {
                    //   _cardController.addItem(_renderContent(questions[0]));
                    //   counter++;
                    // }

                    setState(() {
                      _current++;
                    });

                    // if (dir == Direction.left) {
                    //   print('onDisliked ${(widget as CardView).text} $index');
                    // } else if (dir == Direction.right) {
                    //   print('onLiked ${(widget as CardView).text} $index');
                    // } else if (dir == Direction.up) {
                    //   print('onUp ${(widget as CardView).text} $index');
                    // } else if (dir == Direction.down) {
                    //   print('onDown ${(widget as CardView).text} $index');
                    // }
                  },
                  enableSwipeUp: true,
                  enableSwipeDown: true,
                ),
              ]),
        ),
      ),
    );
  }

  _renderContent(FlashCard question) {
    double cardHeight = 400;
    double cardWidth = 300;

    return Card(
      borderOnForeground: false,
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: Color(0x00000000),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          padding: EdgeInsets.all(8),
          height: cardHeight,
          width: cardWidth,
          decoration: BoxDecoration(
            color: Color(0xFFffffff),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(question.front,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                  )),
            ],
          ),
        ),
        back: Container(
          padding: EdgeInsets.all(8),
          height: cardHeight,
          width: cardWidth,
          decoration: BoxDecoration(
            color: Color(0xFFffffff),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(question.back,
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}

class FlashCard {
  String front;
  String back;

  FlashCard({required this.front, required this.back});
}
