import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget 
{
  const ExpensesItem({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(expense.title,style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4,),
          Row(
            children: [
              Text(
                '\$${expense.amount.toStringAsFixed(2)}',
              ),
               const Spacer(),
              Row(
                children: [
                   Icon(categoryIcon[expense.category]),
                  const SizedBox(width: 10,),
                  Text(expense.formatteDate) ,
              ],)
            ],
          )
        ],
      ),),
    );
  }
}