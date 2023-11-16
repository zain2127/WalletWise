import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:walletwise/models/expense_item.dart';

class HiveDatabase {
  final _mybox = Hive.box('expense_database');

  void saveData(List<ExpenseItem> allexpense) {
    List<List<dynamic>> allExpenseFormated = [];

    for (var expense in allexpense) {
      List<dynamic> expenseFormatted = [
        expense.uid,
        expense.amount,
        expense.name,
        expense.dateTime
      ];
      allExpenseFormated.add(expenseFormatted);
    }
    _mybox.put("All_Expenses", allExpenseFormated);
  }

  List<ExpenseItem> readData() {
    List savedExpense = _mybox.get("All_Expenses") ?? [];
    List<ExpenseItem> allExpense = [];

    for (int i = 0; i < savedExpense.length; i++) {
      String uid = savedExpense[i][0];
      String currentUserID = FirebaseAuth.instance.currentUser!.uid;
      if (savedExpense[i][0] == currentUserID) {
        String amount = savedExpense[i][1];
        String name = savedExpense[i][2];
        DateTime dateTime = savedExpense[i][3];
        print("UID ::" + uid);
        print("Current User_Id" + currentUserID);

        ExpenseItem expense = ExpenseItem(
            name: name, amount: amount, dateTime: dateTime, uid: uid);
        allExpense.add(expense);
      }
    }

    return allExpense;
  }
}
