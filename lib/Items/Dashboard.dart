import 'package:flutter/material.dart';
import 'OnlinePanel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dashoboard extends StatelessWidget {
  const Dashoboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [OnlinePanel(), contentBox()],
      ),
    );
  }

  Widget contentBox() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.grey.withOpacity(0.3)),
      margin: EdgeInsets.only(right: 120),
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            color: Colors.amber,
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                indicatorBox1(
                    title: "Nombre d'emplyés actuels",
                    mainContent: "15",
                    mainIndicat: 0.5,
                    perform: true),
                SizedBox(width: 8),
                indicatorBox1(
                    title: "Somme des paiements",
                    mainContent: "1 150 000 XOF",
                    mainIndicat: 11,
                    perform: true),
                SizedBox(width: 8),
                indicatorBox1(
                    title: "Tâches effectuées",
                    mainContent: "34",
                    mainIndicat: 20,
                    perform: false),
                SizedBox(width: 8),
                indicatorBox1(
                    title: "Tâches annulées",
                    mainContent: "17",
                    mainIndicat: -5,
                    perform: true)
              ],
            ),
          ),
          Row(
            children: [LineChartWidget(), SlicerBox()],
          )
        ],
      ),
    );
  }

  Widget indicatorBox1(
      {String? title,
      String? mainContent,
      double? mainIndicat,
      required bool perform}) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 150, maxWidth: 200.0),
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                        fontSize: 10.0,
                        color: Color.fromARGB(255, 220, 107, 0),
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    mainContent!,
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    // color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        perform
                            ? Icon(Icons.arrow_upward,
                                size: 9.0, color: Colors.green)
                            : Icon(
                                Icons.arrow_downward,
                                size: 9.0,
                                color: Colors.red,
                              ),
                        Text(
                          " $mainIndicat%",
                          style: TextStyle(
                            color: perform ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
            Text("Semaine dern.")
          ],
        ),
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  LineChartWidget({super.key});

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500, maxHeight: 300),
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        color: Colors.white,
        padding: EdgeInsets.all(8.0),
        child: LineChart(LineChartData(
            minX: 0,
            maxX: 7,
            maxY: 20000,
            minY: 0,
            titlesData: LineTitles.getTitleData(),
            gridData: FlGridData(
              show: false,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 0.5,
                );
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 0.5,
                );
              },
            ),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(1, 10000),
                  FlSpot(2, 2500),
                  FlSpot(3, 5000),
                  FlSpot(4, 15000),
                  FlSpot(5, 14000),
                  FlSpot(6, 10000),
                ],
                isCurved: true,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff23b6e6),
                    const Color(0xff02d39a),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                barWidth: 3,
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                      colors: gradientColors
                          .map((color) => color.withOpacity(0.2))
                          .toList(),
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight),
                ),
              )
            ])),
      ),
    );
  }
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              switch (value.toInt()) {
                case 1:
                  return Text('Lun');
                case 2:
                  return Text('Mar');
                case 3:
                  return Text('Mer');
                case 4:
                  return Text('Jeu');
                case 5:
                  return Text('Ven');
                case 6:
                  return Text('Sam');

                default:
                  return Text('');
              }
            },
          ),
        ),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      );
}

class SlicerBox extends StatefulWidget {
  const SlicerBox({super.key});

  @override
  State<SlicerBox> createState() => _SlicerBoxState();
}

class _SlicerBoxState extends State<SlicerBox> {
  double num2 = 1234567.89;
  NumberFormat formatter = NumberFormat('#,###', 'en_US');
  int heure = 1;
  @override
  Widget build(BuildContext context) {
    return indicatorBox2(
        title: "Paiement Moy.",
        mainContent: "17",
        mainIndicat: -5,
        perform: true);
  }

  Widget indicatorBox2(
      {String? title,
      String? mainContent,
      double? mainIndicat,
      required bool perform}) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 250, maxWidth: 200.0),
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                        fontSize: 11.0,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${formatter.format(1150000 * heure ~/ 24)}",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    // color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        perform
                            ? Icon(Icons.arrow_upward,
                                size: 9.0, color: Colors.green)
                            : Icon(
                                Icons.arrow_downward,
                                size: 9.0,
                                color: Colors.red,
                              ),
                        Text(
                          " $mainIndicat%",
                          style: TextStyle(
                            color: perform ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
            Slider(
              value: heure.toDouble(),
              divisions: 2,
              onChanged: (value) {
                setState(() {
                  heure = value.toInt();
                });
              },
              min: 1,
              max: 24,
            ),
            Text(
              "Sur: " + heure.toString() + "heure(s)",
              style: const TextStyle(
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
