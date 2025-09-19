import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();
final formatter = DateFormat.yMd();
enum Category { food, travel, leisure, work }
const cateogoryIcon = {
  Category.food: Icons.food_bank,
  Category.travel: Icons.flight,
  Category.leisure: Icons.movie_sharp,
  Category.work: Icons.work

};
class Expense {
  // Remove `const` from the constructor
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formatedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.expenses, required this.category});
   ExpenseBucket.forCategory(List<Expense> allExpenses, this.category):
   expenses = allExpenses.where((expense)=> expense.category == category ).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses{
    double sum = 0;
    for(final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}