import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_moretech_mobile/app/top_level_providers.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final rememberedCards = watch(rememberedCardsProvider);
    final notRememberedCards = watch(notRememberedCardsProvider);

    Widget _buildImage(String assetName) {
      return Image.asset("images/$assetName",);
    }

    _buildStatRow(String statName, int statValue){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(statName, style: TextStyle(fontSize: 16),),
          Text(statValue.toString(), style: TextStyle(fontSize: 16),),
        ],
      );
    }

    return SafeArea(
      child: Container(
        child: Center(
            child: Column(children: [
          _buildImage("camp.png"),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Лагерь",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),

                _buildStatRow("Количество побед:", 4),
                _buildStatRow("Количество поражений:", 9),
                _buildStatRow("Серия побед:", 2),
                _buildStatRow("Количество выученных терминов:", rememberedCards.state),
                _buildStatRow("Количество сохраненных терминов:", notRememberedCards.state),
                _buildStatRow("Бла-бла-бла:", 4),
                _buildStatRow("Бла-бла-бла:", 4),
                _buildStatRow("Бла-бла-бла:", 4),
              ],
            ),
          ),
        ])),
      ),
    );
  }
}
