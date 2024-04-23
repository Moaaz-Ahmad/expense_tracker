import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesItem extends StatelessWidget {
  final Expense expense;

  const ExpensesItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${expense.amount}'),
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(width: 10),
            Icon(
              expense.icon,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(expense.date),
        ),
      ),
    );
  }
}