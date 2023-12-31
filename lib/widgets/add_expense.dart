// The Platform class is available in dart:io, that's why it is imported here
import 'dart:io';
// The cupertino package is the IOS styling design language which helps to give your app an IOS look and feel
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:betaspend/models/expense.dart";
// import 'package:flutter/rendering.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;

  Category _selectedCategory = Category.work;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month - 1, now.day);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showDialogue() {
    // This code checks which platform the app is running and conditionally
    // render a platform-specific UI to adapt to that specific platform, this is called adaptive design
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text("Invalid input"),
                content: const Text(
                    "Please make sure you have entered a valid title, amount, date and category"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text("okay"),
                  ),
                ],
              ));
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid input"),
          content: const Text(
              "Please make sure you have entered a valid title, amount, date and category"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("okay"),
            ),
          ],
        ),
      );
    }
  }

  void _handleSubmitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final isEnteredAmountInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        isEnteredAmountInvalid ||
        _selectedDate == null) {
      _showDialogue();

      return;
    }
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
  }

// N/B:dispose method like initState and build method is part of
//a StatefulWidget's lifecycle. it's called automatically by Flutter
//when the widget and its state are about to be destroyed(i.e removed from the UI)
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        // width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if (width >= 700)
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          // onChanged: _saveTitleInput,
                          controller: _titleController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text('Title'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          // onChanged: _saveTitleInput,
                          controller: _amountController,
                          maxLength: 16,
                          decoration: const InputDecoration(
                              label: Text('Amount'), prefixText: "\$ "),
                        ),
                      ),
                    ],
                  )
                else
                  TextField(
                    // onChanged: _saveTitleInput,
                    controller: _titleController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                    ),
                  ),
                if (width >= 700)
                  Row(
                    children: [
                      DropdownButton(
                          value: _selectedCategory,
                          items: Category.values
                              .map((category) => DropdownMenuItem(
                                    // The value arg is to used to store whatever the user selects from the dropdown
                                    value: category,

                                    //N/B: We have access to the enum Category here because we have imported
                                    //the file that contains it at the top of this file which gives us access to it
                                    // The values property and name property (on the individual category)
                                    //are provided by dart in order to be able to access the  enum individual values
                                    //and the map result itself needs a toList function because DropDownButton expects a list.
                                    child: Text(
                                      category.name.toUpperCase(),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                          }),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(_selectedDate == null
                                ? "Select date"
                                //We can use the format method here because importing
                                //at the top of this file gives us access to the method
                                // N/B: exclamation is used here to force Dart to accept
                                //_selectedDate has a value that can not be null.
                                : formatter.format(_selectedDate!)),
                            IconButton(
                                onPressed: _presentDatePicker,
                                icon: const Icon(Icons.calendar_month))
                          ],
                        ),
                      )
                    ],
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          // onChanged: _saveTitleInput,
                          controller: _amountController,
                          maxLength: 16,
                          decoration: const InputDecoration(
                              label: Text('Amount'), prefixText: "\$ "),
                        ),
                      ),
                      // const SizedBox(
                      //   width: 16,
                      // ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(_selectedDate == null
                                ? "Select date"
                                //We can use the format method here because importing
                                //at the top of this file gives us access to the method
                                // N/B: exclamation is used here to force Dart to accept
                                //_selectedDate has a value that can not be null.
                                : formatter.format(_selectedDate!)),
                            IconButton(
                                onPressed: _presentDatePicker,
                                icon: const Icon(Icons.calendar_month))
                          ],
                        ),
                      )
                    ],
                  ),
                if (width >= 700)
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: _handleSubmitExpenseData,
                          child: const Text(
                            "Save Expense",
                            style: TextStyle(fontSize: 12),
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontSize: 12),
                          ))
                    ],
                  )
                else
                  Row(
                    children: [
                      DropdownButton(
                          value: _selectedCategory,
                          items: Category.values
                              .map((category) => DropdownMenuItem(
                                    // The value arg is to used to store whatever the user selects from the dropdown
                                    value: category,

                                    //N/B: We have access to the enum Category here because we have imported
                                    //the file that contains it at the top of this file which gives us access to it
                                    // The values property and name property (on the individual category)
                                    //are provided by dart in order to be able to access the  enum individual values
                                    //and the map result itself needs a toList function because DropDownButton expects a list.
                                    child: Text(
                                      category.name.toUpperCase(),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }
                            setState(() {
                              _selectedCategory = value;
                            });
                          }),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: _handleSubmitExpenseData,
                          child: const Text(
                            "Save Expense",
                            style: TextStyle(fontSize: 12),
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontSize: 12),
                          ))
                    ],
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
