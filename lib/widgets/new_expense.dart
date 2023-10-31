import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker_flutter_app/models/expenses.dart';

final formater = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountConroller = TextEditingController();
  Categories _category = Categories.lesure;

  DateTime? _selectedDate;
  void _showDatePicker() async {
    final date = DateTime.now();
    final firstDate = DateTime(date.year - 1, date.month, date.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: firstDate,
        lastDate: date);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _saveExpense() {
    final amount = double.tryParse(_amountConroller.text);
    if (_selectedDate == null ||
        _titleController.text.trim().isEmpty ||
        amount == null ||
        amount <= 0) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Please Enter valid title,date and amount"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            )
          ],
        ),
      );
      return;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountConroller.dispose();
    super.dispose();
  }

  _NewExpenseState();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  controller: _amountConroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Select Date"
                          : formater.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _showDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                value: _category,
                items: Categories.values
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
                    _category = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: _saveExpense,
                child: const Text("Save"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
