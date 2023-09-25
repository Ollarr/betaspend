import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

enum Category { food, accessories, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.accessories: Icons.shopping_bag,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};
// DateFormat is a date formattter provided by intl(a package) that has
// a lot of utility method that one could use to format dates easily.
//In the code below, we instantiated it and assigned  it to a variable,
//however to make it work as expected we still need to invoke the format method on
//it and pass the data to be formatted to it as an arg. and that is done in formatDate getter function
final formatter = DateFormat.yMd();

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

// N/B: Another way to create a method/function is to use a getter like it is used below.
//it is almost like creating a function only that the parenthesis is omitted and at the point of
//calling it i.e where it is used, it is done without adding parenthesis too.
  String get formattedDate {
    return formatter.format(date);
  }
}
