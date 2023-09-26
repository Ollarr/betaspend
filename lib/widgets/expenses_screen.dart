// ignore_for_file: unused_field

import 'package:betaspend/widgets/add_expense.dart';
import 'package:betaspend/widgets/expenses_list/expenses_list.dart';
import 'package:betaspend/models/expense.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "React Native Course",
        amount: 4500.00,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Netflix and no chill",
        amount: 2000.00,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: "Bvlgari perfume",
        amount: 25000.00,
        date: DateTime.now(),
        category: Category.accessories)
  ];

  void _addNewExpenseModal() {
    // this is a widget provided by flutter to create a modal.
    //It has two required args, the context arg requires a context value
    //and in our case we provided the global context object(think of context as
    //some kind of metadata collection, an object full of metadata managed by
    //flutter that belongs to a specific widget, it contains metadata information
    //related to such widget and more importantly related to its position in the widget tree)
    //Note: when a widget extends a state widget,
    //flutter automatically adds a context property to such widget class
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(
            onAddExpense: _addExpense,
          );
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BETASPEND",
          style:
              TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: _addNewExpenseModal, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          // The reason for wrapping the ExpensesList inside the Expanded widget is
          //because column expected a list but then it's gettin a list that contains another list
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
