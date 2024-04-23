
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

const uuid = Uuid();
enum ExpenseCategory {
  food,
  transportation,
  housing,
  utilities,
  health,
  insurance,
  personal,
  education,
  entertainment,
  miscellaneous,
}
const categoryIcons = {
  ExpenseCategory.food: Icons.fastfood,
  ExpenseCategory.transportation: Icons.directions_bus,
  ExpenseCategory.housing: Icons.home,
  ExpenseCategory.utilities: Icons.flash_on,
  ExpenseCategory.health: Icons.healing,
  ExpenseCategory.insurance: Icons.security,
  ExpenseCategory.personal: Icons.person,
  ExpenseCategory.education: Icons.book,
  ExpenseCategory.entertainment: Icons.movie,
  ExpenseCategory.miscellaneous: Icons.more_horiz,
};
class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;
  final IconData icon;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.icon,
  }): id = uuid.v4();
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    this.category,
  ) : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();
  
  final ExpenseCategory category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}