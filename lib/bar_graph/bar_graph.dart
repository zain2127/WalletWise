import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:walletwise/bar_graph/bar_data.dart';
import 'package:walletwise/data/expense_data.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  const MyBarGraph(
      {super.key,
      required this.maxY,
      required this.sunAmount,
      required this.monAmount,
      required this.tueAmount,
      required this.wedAmount,
      required this.thurAmount,
      required this.friAmount,
      required this.satAmount});

  @override
  Widget build(BuildContext context) {
    double calculateMax(
        ExpenseData value,
        String sunday,
        String monday,
        String tuesday,
        String wednesday,
        String thursday,
        String friday,
        String saturday) {
      double? max = 100;

      List<double> values = [
        value.calculateDailyExpenseSummary()[sunday] ?? 0,
        value.calculateDailyExpenseSummary()[monday] ?? 0,
        value.calculateDailyExpenseSummary()[tuesday] ?? 0,
        value.calculateDailyExpenseSummary()[wednesday] ?? 0,
        value.calculateDailyExpenseSummary()[thursday] ?? 0,
        value.calculateDailyExpenseSummary()[friday] ?? 0,
        value.calculateDailyExpenseSummary()[saturday] ?? 0,
      ];

      values.sort();

      max = values.last * 1.1;

      return max == 0 ? 100 : max;
    }

    BarData myBarData = BarData(
        sunAmount: sunAmount,
        monAmount: monAmount,
        tueAmount: tueAmount,
        wedAmount: wedAmount,
        thurAmount: thurAmount,
        friAmount: friAmount,
        satAmount: satAmount);

    myBarData.initializeBarData();
    return BarChart(BarChartData(
      maxY: 30000,
      minY: 0,
      gridData: const FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: const FlTitlesData(
        show: true,
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: getBottomTitles,
        )),
      ),
      barGroups: myBarData.barData
          .map((data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                    toY: data.y,
                    color: Colors.blue.shade500,
                    width: 25,
                    backDrawRodData: BackgroundBarChartRodData(
                        show: true, toY: maxY, color: Colors.grey[200]),
                    borderRadius: BorderRadius.circular(4)),
              ]))
          .toList(),
    ));
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(color: Colors.blue, fontWeight: FontWeight.bold);

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'S',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'M',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'T',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'W',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'T',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'F',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'S',
        style: style,
      );
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
