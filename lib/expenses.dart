import 'package:expenses/models/expense.dart';
import 'package:expenses/widgets/chart/chart.dart';
import 'package:expenses/widgets/expenses_list.dart';
import 'package:expenses/widgets/new_expense.dart';
import 'package:flutter/material.dart';
class Expenses extends StatefulWidget
{
    const Expenses({super.key});
    @override
    State<Expenses> createState() => _ExpensesState();

    // final Function() toggleTheme;
}

class _ExpensesState extends State<Expenses> 
{
    final List<Expense> _registeredExpenses=[
        Expense( //obgect for class
          category: Category.work,
          title: "Flutter",
          amount: 2.9,
          date: DateTime.now(),
        ),
        Expense( //obgect for class
          category: Category.leisure,
          title: " Course",
          amount: 28.9,
          date: DateTime.now(),
        )
    ];
     void _addExpense(Expense expense){
      setState(() {
        _registeredExpenses.add(expense);
      });
     }
     void _removeExpense(Expense expense){
      setState(() {
        _registeredExpenses.remove(expense);
      });
     }
    @override
    Widget build(BuildContext context)
    {
      return  Scaffold(
        appBar: AppBar(
          title: const Center(child:  Text("Expanses App")),
          actions: [
            IconButton(
              onPressed: (){
                showModalBottomSheet(context: context, builder: (ctx)=>NewExpense(onAddExpense: _addExpense, )
                 );
            },
            icon:const Icon(Icons.add),
              ),
            OutlinedButton.icon(
                onPressed:(){},
                label:const Text(""),
                icon:const Icon( Icons.brightness_2)
              )   ,
          ],
          ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Chart(expenses: _registeredExpenses),
              Expanded(
                child: ExpensesList(
                  onRemoveExpense:_removeExpense,
                  expenses: _registeredExpenses,
                  ),
                ),
            ],
          ),
        ),
      );
    }
}




