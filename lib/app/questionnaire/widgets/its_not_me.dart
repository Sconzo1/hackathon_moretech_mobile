import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_moretech_mobile/app/top_level_providers.dart';

class ConfigureAvatarPage extends ConsumerWidget {
  const ConfigureAvatarPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final userAvatar = watch(userAvatarProvider);
    final userSex = watch(userSexProvider);
    final userAge = watch(userAgeProvider);
    final userIncome = watch(userIncomeProvider);
    final userMarriageStatus = watch(userMarriageStatusProvider);

    void _changeSex() {
      if (userSex.state == 'мужчина') {
        userSex.state = 'женщина';
      } else {
        userSex.state = 'мужчина';
      }
    }

    void _changeAge() {
      userAge.state = Random().nextInt(60) + 1;
    }

    void _changeIncome() {
      switch (userIncome.state) {
        case 'низкий' : {
          userIncome.state = 'средний';
          break;
        }
        case 'средний' : {
          userIncome.state = 'выше среднего';
          break;
        }
        case 'выше среднего' : {
          userIncome.state = 'высокий';
          break;
        }
        case 'высокий' : {
          userIncome.state = 'вще дохуя';
          break;
        }
        case 'вще дохуя' : {
          userIncome.state = 'низкий';
          break;
        }
      }
    }

    void _changeMarriageStatus() {
      switch (userMarriageStatus.state) {
        case 'холост' : {
          userMarriageStatus.state = 'вдовец';
          break;
        }
        case 'вдовец' : {
          userMarriageStatus.state = 'женат';
          break;
        }
        case 'женат' : {
          userMarriageStatus.state = 'есть дети';
          break;
        }
        case 'есть дети' : {
          userMarriageStatus.state = 'холост';
          break;
        }
      }
    }

    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 12)),
          Text(
            'Познакомимся?',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.only(top: 16)),
          Text(
            'Пол',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _changeSex,
                icon: Icon(Icons.arrow_back_ios),
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              Container(
                  width: 150,
                  child: Text(
                    userSex.state,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  )),
              IconButton(
                onPressed: _changeSex,
                icon: Icon(Icons.arrow_forward_ios),
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ],
          ),
          Divider(),
          Text(
            'Возраст',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _changeAge,
                icon: Icon(Icons.arrow_back_ios),
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              Container(
                  width: 150,
                  child: Text(
                    userAge.state.toString(),
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  )),
              IconButton(
                onPressed: _changeAge,
                icon: Icon(Icons.arrow_forward_ios),
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ],
          ),
          Divider(),
          Text(
            'Доход',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _changeIncome,
                icon: Icon(Icons.arrow_back_ios),
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              Container(
                  width: 150,
                  child: Text(
                    userIncome.state,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  )),
              IconButton(
                onPressed: _changeIncome,
                icon: Icon(Icons.arrow_forward_ios),
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ],
          ),
          Divider(),
          Text(
            'Семейное положение',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _changeMarriageStatus,
                icon: Icon(Icons.arrow_back_ios),
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              Container(
                  width: 150,
                  child: Text(
                    userMarriageStatus.state,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  )),
              IconButton(
                onPressed: _changeMarriageStatus,
                icon: Icon(Icons.arrow_forward_ios),
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
            ],
          ),

        ],
      ),
    );
  }
}
