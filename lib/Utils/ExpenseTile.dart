import 'package:flutter/material.dart';

class ExpenseTile extends StatefulWidget {
  String name, expense;
  DateTime date;
  ExpenseTile(
      {super.key,
      required this.name,
      required this.expense,
      required this.date});

  @override
  State<ExpenseTile> createState() => _ExpenseTileState();
}

class _ExpenseTileState extends State<ExpenseTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          // tileColor: Colors.blue.shade200,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(widget.name),
          subtitle: Text(
              '${widget.date.day}/${widget.date.month}/${widget.date.year}'),
          trailing: Text("${widget.expense} Rs"),
        ),
      ),
    );
  }
}
