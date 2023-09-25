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

  @override
  Widget build(context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('The Chart'),
          Text("My Expenses List"),
        ],
      ),
    );
  }
}
