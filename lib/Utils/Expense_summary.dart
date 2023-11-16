import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walletwise/bar_graph/bar_graph.dart';
import 'package:walletwise/data/expense_data.dart';
import 'package:walletwise/dateTime/date_time_helper.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime? startOfWeek;
  const ExpenseSummary({super.key, required this.startOfWeek});
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

  String WeekTotal(
      ExpenseData value,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday) {
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];

    double total = 0;

    for (var i = 0; i < values.length; i++) {
      total += values[i];
    }

    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    String Sunday =
        convertDateTimeToString(startOfWeek!.add(const Duration(days: 0)));
    String Monday =
        convertDateTimeToString(startOfWeek!.add(const Duration(days: 1)));
    String Tuesday =
        convertDateTimeToString(startOfWeek!.add(const Duration(days: 2)));
    String Wednesday =
        convertDateTimeToString(startOfWeek!.add(const Duration(days: 3)));
    String Thursday =
        convertDateTimeToString(startOfWeek!.add(const Duration(days: 4)));
    String Friday =
        convertDateTimeToString(startOfWeek!.add(const Duration(days: 5)));
    String Saturday =
        convertDateTimeToString(startOfWeek!.add(const Duration(days: 6)));
    return Consumer<ExpenseData>(
        builder: (context, value, child) => Column(
              children: [
                SizedBox(
                  height: 180,
                  child: MyBarGraph(
                      maxY: 35000,
                      sunAmount:
                          value.calculateDailyExpenseSummary()[Sunday] ?? 0,
                      monAmount:
                          value.calculateDailyExpenseSummary()[Monday] ?? 0,
                      tueAmount:
                          value.calculateDailyExpenseSummary()[Tuesday] ?? 0,
                      wedAmount:
                          value.calculateDailyExpenseSummary()[Wednesday] ?? 0,
                      thurAmount:
                          value.calculateDailyExpenseSummary()[Thursday] ?? 0,
                      friAmount:
                          value.calculateDailyExpenseSummary()[Friday] ?? 0,
                      satAmount:
                          value.calculateDailyExpenseSummary()[Saturday] ?? 0),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Weekly Total",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "Rs ${WeekTotal(value, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday)}")
                    ],
                  ),
                ),
              ],
            ));
  }
}
