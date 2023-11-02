import 'package:expense_tracker_flutter_app/widgets/expensesList/expenses_list.dart';
import 'package:expense_tracker_flutter_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter_app/models/expenses.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> __expensesList = [];

  void addNewExpense(Expense expenseData) {
    setState(() {
      __expensesList.add(
        Expense(
            title: expenseData.title,
            amount: expenseData.amount,
            date: expenseData.date,
            category: expenseData.category),
      );
    });
    Navigator.pop(context);
  }

  void openAddModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(addNewExpense),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense tracker flutter app",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(onPressed: openAddModal, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(children: [
        const Text("Charts"),
        Expanded(
          child: ExpensesList(expenses: __expensesList),
        ),
      ]),
    );
  }
}
