// ignore_for_file: unused_field

import 'package:betaspend/widgets/add_expense.dart';
import 'package:betaspend/widgets/expenses_list/expenses_list.dart';
import 'package:betaspend/models/expense.dart';
import 'package:betaspend/widgets/chart/chart.dart';
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
        useSafeArea: true,
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

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense removed."),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    //This is used to get the width of the screen size and will be
    //used to conditionally render the UI based on the orientation(portrait or landscape)
    // N/B: Widgets get sized based on their size preferences & parent widget size constraints
    // e.g the Column widgets height preference: takes as much as possible and it is important
    //that it is placed within a parent widget that restricts its height otherwise it will go
    //outside of the screen boundary that's why it is wrapped within the scaffold widget most of
    // the times because the scaffold widget by default constrains the height and width of whatever
    // is placed within it to the maximum device height and width andthe contraints of the parent's
    // widget overrides that of the child/children preferences  while width preference: takes as much
    // as needed/defined by its children and so when we are sometimes confronted with issues like this
    //wheremwe need to wrap an uncontrained widget within an unconstrained widget we used the Expanded
    // widget because it helps to set height and width contraints
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No expenses found, start adding now!"),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "BETASPEND",
            style: TextStyle(
                color: Colors.greenAccent, fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
                onPressed: _addNewExpenseModal, icon: const Icon(Icons.add))
          ],
        ),
        body: width < 600
            ? Column(
                children: [
                  Chart(
                    expenses: _registeredExpenses,
                  ),
                  // The reason for wrapping the ExpensesList inside the Expanded widget is
                  //because column expected a list but then it's gettin a list that contains another list
                  Expanded(
                    child: mainContent,
                  ),
                ],
              )
            : Row(
                children: [
                  // The reason this is wrapped inside expanded widget here is
                  //because the Chart widget is configured to take as much space
                  //as is available and by default the row widget works essentially
                  //the same way and so to rectify any error this might cause we need
                  //to wrap the child widget (Chart) inside expanded widget
                  Expanded(
                    child: Chart(
                      expenses: _registeredExpenses,
                    ),
                  ),
                  // The reason for wrapping the ExpensesList inside the Expanded widget is
                  //because column expected a list but then it's gettin a list that contains another list
                  Expanded(
                    child: mainContent,
                  ),
                ],
              ));
  }
}
