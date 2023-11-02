import 'package:expense_tracker_flutter_app/models/expenses.dart';
import 'package:expense_tracker_flutter_app/widgets/expensesList/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});
  final List<Expense> expenses;
  final void Function(Expense) removeExpense;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          // color: Theme.of(context).colorScheme.error.withOpacity(0.2),
          margin: Theme.of(context).cardTheme.margin,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.error.withOpacity(0.2),
          ),
        ),
        onDismissed: (direction) => {
          removeExpense(
            expenses[index],
          )
        },
        key: ValueKey(
          expenses[index],
        ),
        child: ExpenseItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
