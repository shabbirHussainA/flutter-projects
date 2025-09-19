import 'package:expense_tracker/widget/chart/chart.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(), // Use DateTime.now() for the current date.
      category: Category.work, // Assuming you have a Category enum.
    ),
    Expense(
      title: 'Cinema Tickets',
      amount: 15.50,
      date: DateTime.now().subtract(const Duration(days: 2)), // Two days ago.
      category: Category.leisure,
    ),
    Expense(
      title: 'Weekly Groceries',
      amount: 85.32,
      date: DateTime.now().subtract(const Duration(days: 5)), // Five days ago.
      category: Category.food,
    ),
  ];
  void _openAddExpenseOverlay(){
    showModalBottomSheet( isScrollControlled: true, context: context, builder: (ctx)=> NewExpense(onAddExpense:addExpense ,));
  }
  void addExpense(Expense expense){
    print('expense added ');
    setState(() {
    _registeredExpense.add(expense);
    });
  }
  
  void removeExpense(Expense expense){
    final expeseIndex = _registeredExpense.indexOf(expense);
    setState(() {
    _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Expense Deleted successfully'), duration: const Duration(seconds: 3), action: SnackBarAction(label: "Undo", onPressed: (){
        setState(() {
          _registeredExpense.insert(expeseIndex, expense);
        });
      }),),
    );
  }
  @override 
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text('No content Found Try adding some!'),
    );
    if (_registeredExpense.isNotEmpty ){
      mainContent =ExpensesList(Expenses: _registeredExpense, onRemovedExpense: removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expense Tracker'),
        actions: [IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))],
      ),
      body: Center(
        child: Column(
          children: [
            Chart(expenses: _registeredExpense),
            Text('the Expenses List'),
            Expanded(child: mainContent),
          ],
        ),
      ),
    );
  }
}
