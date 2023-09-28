import 'package:betaspend/models/expense.dart';
import 'package:betaspend/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    // The ListView widget is usually used to create a list of items where the length
    // of the items is not known but have the potential to be much, and it therefore
    //render all the items when the ListView contructor is called even the ones that
    //are not yet visible, as a result of that we are using ListView.builder instead
    //as this create the a list of items only when they are needed to be rendered/visible
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(
            color:
                Theme.of(context).colorScheme.errorContainer.withOpacity(0.4)),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
