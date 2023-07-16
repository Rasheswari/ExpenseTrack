
import 'package:expense_track/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
 

final formatter = DateFormat.yMd();

class Newexpense extends StatefulWidget {
  const Newexpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<Newexpense> createState() {
    return _NewexpenseState();
  }
}

class _NewexpenseState extends State<Newexpense> {
  final _titlecontroller = TextEditingController();
  final _amtcontroller = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatepicker() async {
    final now = DateTime.now();

    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _sumbitExpenseData() {
    final enteredamt = double.tryParse(_amtcontroller.text);

    // tryparse ('hello) =>null  ,tryparse('1.12') =>1.12

    final amtinvalid = enteredamt == null || enteredamt <= 0;

    if (_titlecontroller.text.trim().isEmpty ||
        amtinvalid ||
        _selectedDate == null) {
      // show error

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text("Please enter Valid Inputs "),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('okay'),
            )
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
        title: _titlecontroller.text,
        amt: enteredamt,
        date: _selectedDate!,
        category: _selectedCategory));
        Navigator.pop(context);
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _amtcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titlecontroller,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amtcontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Selected date '
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _presentDatepicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value as Category  ;
                  },
                  );
                },
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                onPressed: _sumbitExpenseData,
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
