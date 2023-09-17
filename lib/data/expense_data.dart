import 'package:flutter/material.dart';
import 'package:walletwise/dateTime/date_time_helper.dart';
import 'package:walletwise/models/expense_item.dart';

class ExpenseData extends ChangeNotifier{
  //expense List
  List<ExpenseItem> overallExpenseList = [];
  //get all expensesl
  List<ExpenseItem> getAllExxpenseList(){
    return overallExpenseList;
  }
  // add new expenses
  void addNewExpense(ExpenseItem addNewExpense)
  {
    overallExpenseList.add(addNewExpense);
  }
  // remove expennses
  void removeExpense(ExpenseItem deleteExxpense){
    overallExpenseList.remove(deleteExxpense);
  }
  // getting day by name
  String getDayName(DateTime dateTime)
  {
    switch(dateTime.weekday)
    {
      case '1': return 'Mon';
      case '2': return 'Tue';
      case '3': return 'Wed';
      case '4': return 'Thu';
      case '5': return 'Fri';
      case '6': return 'Sat';
      case '7': return 'Sun';
      default : return '';
    }
  }

  //get start day of week

  DateTime startOfWeek(){
    DateTime? startOfWeek;

    DateTime today = DateTime.now();
     
    for (var i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  //calculate

  Map<String, double> calculateDailyExpenseSummary(){
    Map<String,double> dailyExpenseSummary = {
        
    };

    for(var expense in overallExpenseList){
        String date = convertDateTimeToString(expense.dateTime);
        double amount = double.parse(expense.amount);

        if(dailyExpenseSummary.containsKey(date)){
          double currentAmount = dailyExpenseSummary[date]!;
          currentAmount += amount;
          dailyExpenseSummary[date] = currentAmount;
        }
        else
        {
          dailyExpenseSummary.addAll({date : amount});
        }
    }
    return dailyExpenseSummary;
  }
}