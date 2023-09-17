import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walletwise/Controlller/AuthenticationController.dart';
import 'package:walletwise/Utils/ExpenseTile.dart';
import 'package:walletwise/data/expense_data.dart';
import 'package:walletwise/models/expense_item.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final expenseNameController = TextEditingController();
    final expenseAmountController = TextEditingController();

  void addExpense(){
    showDialog(context: context,
     builder: (context) =>  AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
      title: const Text('Add New Expense'),
      content:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: expenseNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20.0),
              ),
              fillColor: Colors.grey[200],
              filled: true,
              hintText: 'Enter Expense Name'
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: expenseAmountController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true,
              fillColor: Colors.grey[200],
              hintText: 'Enter Expense Amount'
            ),
            ),
        ],
      ),
      actions: [
        MaterialButton(onPressed: save , child:  Text('Save',style: TextStyle(color: Colors.blue.shade800),),),
         MaterialButton(onPressed: cancel, child: const Text('Cancel'),)
      ],
     )
    );
  }

  void save(){
       ExpenseItem newExpense =ExpenseItem(name: expenseNameController.text, amount: expenseAmountController.text, dateTime: DateTime.now());
      expenseAmountController.clear();
      expenseNameController.clear();
       Provider.of<ExpenseData>(context , listen: true).addNewExpense(newExpense);
      Navigator.pop(context);
  }

  void cancel(){
    Navigator.pop(context);
    expenseAmountController.clear();
    expenseNameController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder:(context , value , child) => Scaffold(
        body: ListView.builder(
          itemCount: value.getAllExxpenseList().length,
          itemBuilder: (BuildContext context, int index) { 
          return ExpenseTile(
            name: value.getAllExxpenseList()[index].name,
             expense: value.getAllExxpenseList()[index].amount,
              date: value.getAllExxpenseList()[index].dateTime
              );
         },),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[800],
          onPressed: addExpense,
          child: const Icon(Icons.add),
          ),
      ),
    );
  }
}
