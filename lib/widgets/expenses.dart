 import 'package:expense_track/widgets/expenses_list/expenses_list.dart';
import 'package:expense_track/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_track/models/expense.dart';
import 'package:expense_track/widgets/chart/chart.dart';

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
      title: 'Flutter course',
      amt: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amt: 15.59,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];


void _openAddExpenseOverlay(){
showModalBottomSheet(
  isScrollControlled: true,

  context: context, 
  builder: (ctx)=>Newexpense(onAddExpense:_addexpense),
);

} 
void _addexpense (Expense expense)
{
  setState(() {
    
    _registeredExpenses.add(expense);
  });

}

void _removeExpenses(Expense expense)
{
  final expenseIndex =_registeredExpenses.indexOf(expense);
setState(() {
  _registeredExpenses.remove(expense);
});
ScaffoldMessenger.of(context).clearSnackBars();
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    duration:const  Duration(seconds: 3),
    content:const Text("Expense Deleted"),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: (){
        setState(() {
          _registeredExpenses.insert(expenseIndex, expense);
        });
      },
    ),
    )
    );

}


  @override
  Widget build(BuildContext context) {

   Widget mainContent = const Center(
    child: Text('No Expenses Found!!'),
   );
   if(_registeredExpenses.isNotEmpty)
   {
    mainContent = ExpensesList(
      expenses: _registeredExpenses,
       onRemoveExpense: _removeExpenses);
   }


    return Scaffold(
      appBar:AppBar(
        
        title: const Text("Flutter ExpeneseTrack"),
        actions: [
        IconButton(onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add), )
      ]) ,
      body: Column(
        children: [
          const Text('The chart'),
          Chart(expenses:_registeredExpenses),
          Expanded(
            child: mainContent,
            ),
          
        ],
      ),
    );
  }
}
