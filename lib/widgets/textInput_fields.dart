// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:intl/intl.dart";

class TextInputFields extends StatefulWidget {
  final Function addTransaction;

  const TextInputFields({super.key, required this.addTransaction});

  @override
  State<TextInputFields> createState() => _TextInputFieldsState();
}

class _TextInputFieldsState extends State<TextInputFields> {
  final inputController = TextEditingController();

  final amountController = TextEditingController();

  // this is not final because it will be set once the user selects date
  DateTime? _selectedDate;

  void _addTransactionHanlder() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = inputController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTransaction(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            children: <Widget>[
              TextField(
                controller: inputController,
                autocorrect: true,
                cursorColor: Colors.amber,
                decoration: const InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber))),
                onSubmitted: (_) => _addTransactionHanlder(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  cursorColor: Colors.amber,
                  decoration: const InputDecoration(
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  onSubmitted: (_) => _addTransactionHanlder(),
                ),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? "No Date Chosen!"
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _presentDatePicker,
                      child: const Text(
                        "Choose Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.all(0),
                      overlayColor: MaterialStateProperty.resolveWith(
                          (states) => states.contains(MaterialState.pressed)
                              ? Colors.transparent
                              : null),
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
                      side: MaterialStateProperty.all(BorderSide.none),
                    ),
                    onPressed: _addTransactionHanlder,
                    child: const Text("Create Transaction"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
