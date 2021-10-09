import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartMinigame extends ConsumerWidget {
  const ChartMinigame({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/map.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 24)),
                            Text(
                              'НЕмагический шар',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Padding(padding: EdgeInsets.only(top: 16)),
                            Image.asset('assets/chart.png'),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 16, left: 8, right: 8),
                              child: Text(
                                'В 1978 году в Москве начал извергаться ближайший вулкан, затмив небо пеплом и сажей. \n\nКак повели себя акции крупных российских авиакомпаний при этом?',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlinedButton.icon(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.redAccent,
                                  ),
                                  style: OutlinedButton.styleFrom(
                                      side:
                                          BorderSide(color: Colors.redAccent)),
                                  label: Text(
                                    'Вниз',
                                    style: TextStyle(
                                        color: Colors.redAccent, fontSize: 18),
                                  ),
                                ),
                                OutlinedButton.icon(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: Colors.green)),
                                  icon: Icon(
                                    Icons.arrow_upward,
                                    color: Colors.green,
                                  ),
                                  label: Text(
                                    'Вверх',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 16)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
