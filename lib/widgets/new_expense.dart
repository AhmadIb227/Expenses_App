import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenses/models/expense.dart';

class NewExpense extends StatefulWidget 
{
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // var _title='';
  // void _saveTitleInputed(String inputValue){
  //   setState(() {
  //     _title = inputValue;
  //     log(_title);
  //   });
  // }
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final formatter = DateFormat().add_yMd();
  DateTime? _selecedtDate;
  Category _selectedCategory = Category.travel;
  @override
  void dispose() {
    //هذه الداله يتم تنفيذا عند الخروج من البرنامج يعني هي بعكس داله  ال instate()
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            // onChanged: _saveTitleInputed,//لما تغير قيمة ما ضمن الحقل خدلي القيمة الجديدة عندك
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                    prefixText: "\$",
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selecedtDate == null
                        ? 'No Select Date'
                        : formatter.format(_selecedtDate!)),
                    IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final firstDate =
                            DateTime(now.year - 1, now.month, now.day);
                        final lastDate = DateTime.now();
                        final DateTime? pickedDate =
                            await showDatePicker //من خلال اويت نقوم بتحويل الشء الي ممكن يكون في المستقبل موع بيانات معين الى نو البيانات المحدد ذاك بشكل فوري  ولجعل اي شيء اويت يجب ان يكون غير متزامن وهذا تم عن طريق اسينج
                                (
                                    context: context,
                                    firstDate: firstDate,
                                    lastDate: lastDate);
                        //or w2 //.then((value) => log(value.toString()));
                        setState(() {
                          _selecedtDate = pickedDate;
                        });
                      },
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (newCat) {
                    if (newCat == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = newCat;
                    });
                  }),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // log(_titleController.text);
                      // log(_amountController.text);
                      //validation
                      final double? enteredAmount = 
                             double.tryParse(_amountController.text);
                      final bool amountIsInvaild = 
                             enteredAmount == null || enteredAmount <= 0;
                      //w1 01  //const snackBar=SnackBar(content: Text("data is invaild"));
                      if(_titleController.text.trim().isEmpty || amountIsInvaild || _selecedtDate == null){
                        //w1 02 // ScaffoldMessenger.of(context).showSnackBar(snackBar);           //5 seconds
                        //w2
                        showDialog(
                          context: context,
                           builder:(ctx)=>AlertDialog(
                              title: const Text("Error You"),
                              content: const Text("MY LOve"),
                              actions:[
                                TextButton(
                                  onPressed: () => Navigator.pop(ctx),
                                  child : const Text("Ok")
                                )
                              ]
                           )
                          );
                      }else{
                           widget.onAddExpense(
                        Expense(
                          title: _titleController.text,
                          amount: enteredAmount,
                          date:_selecedtDate! ,
                          category: _selectedCategory
                         )
                        );
                      }
                     
                    },
                    child: const Text('Save Expense'),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
