import 'package:flutter/material.dart';

import 'package:expense_track/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                
                Text('\$${expense.amt.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                      Icon(categoryicons[expense.category]),
                     const SizedBox(width: 9,),
                     Text(expense.formattedDate),
                  ],
                )
              
              ],
            ),
          ],
        ),
      ),
    );
  }
}
