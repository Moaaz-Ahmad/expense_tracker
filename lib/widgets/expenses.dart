import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenses = [];
  void _addExpense() {
    showModalBottomSheet(context: context,isScrollControlled: true, builder: (BuildContext ctx){
      // Add your builder function implementation here
      return NewExpense(addExpense: (Expense newExpense) {
        setState(() {
          expenses.add(newExpense);
        });
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense added successfully!'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(label: 'Undo', onPressed: () {
        setState(() {
          expenses.removeLast();
        });
      },
    )
    ));
      });
    });
  }
  void _deleteExpense(Expense expense) {
    setState(() {
      expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense deleted successfully!'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(label: 'Undo', onPressed: () {
        setState(() {
          expenses.add(expense);
        });
      },
    )
    ));
  }
  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses added yet!'),
    );
    if (expenses.isNotEmpty) {
      mainContent = ExpensesList(expenses: expenses, deleteExpense: _deleteExpense);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addExpense,
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: expenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}