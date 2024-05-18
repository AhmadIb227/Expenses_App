import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
const uuid=Uuid();
final dateFormat=DateFormat.yMd();
enum Category {food,travel,leisure,work}
//انو نوعه هو من الانواع الاربعه  فقط , امل او سفر او متعه
const categoryIcon= {
    Category.food:Icons.lunch_dining,
    Category.work:Icons.work,
    Category.travel:Icons.flight_takeoff,
    Category.leisure:Icons.movie,
};

class Expense
{
    final String id;
    final String title;
    final double amount;
    final DateTime date;
    final Category category;
    String get formatteDate{
      return dateFormat.format(date);
    }
    Expense( {
        required this.title
      , required this.amount,
        required this.date,
        required this.category,
    }): id=uuid.v4();

}
var v1 = Expense( //obgect for class
  category: Category.work,
  title: "Flutter Course",
  amount: 28.9,
  date: DateTime.now(),
);

class ExpenseBucket
{
  final Category category;
  final List<Expense>expenses;
  ExpenseBucket(this.category,  this.expenses);
  ExpenseBucket.forCategory(List<Expense>allExpenses, this.category)
          : expenses = allExpenses
              .where((element)=> element.category == category)
              .toList();

double get totalExpenses 
{
    double sum=0;
    for(var expense in expenses)
    {
      sum=sum + expense.amount;
    }
    return sum;
}

}