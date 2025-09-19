import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.Expenses,
    required this.onRemovedExpense,
  });
  final List<Expense> Expenses;
  final Function(Expense expense) onRemovedExpense;
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(Expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemovedExpense(Expenses[index]);
        },
        child: ExpensesItem(Expenses[index]),
      ),
    );
  }
}
