import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key,required this.expenses,required this.deleteExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) deleteExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          deleteExpense(expenses[index]);
        },
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
            margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          child: const Icon(Icons.delete, color: Colors.white, size: 40),
        ),
        child: ExpensesItem(expense: expenses[index]));
      },
    );
  }
}