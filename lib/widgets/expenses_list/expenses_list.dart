  import 'package:expense_track/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_track/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses,
  required this.onRemoveExpense});
final List<Expense>expenses;
final void Function (Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: expenses.length,
    itemBuilder: (context, index) =>
     Dismissible(key: ValueKey(expenses[index]),
     background: Container(
      color: Theme.of(context).colorScheme.error.withOpacity(0.75),
      margin: const EdgeInsets.symmetric(horizontal: 16),
     ),
     onDismissed: (direction){
      onRemoveExpense(expenses[index]);
     },
      child:ExpenseItem(expenses[index])));
    
  }

}