// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputFields extends StatefulWidget {
  final Function addTransaction;

  const TextInputFields({super.key, required this.addTransaction});

  @override
  State<TextInputFields> createState() => _TextInputFieldsState();
}

class _TextInputFieldsState extends State<TextInputFields> {
  final inputController = TextEditingController();

  final amountController = TextEditingController();

  void _addTransactionHanlder() {
    final enteredTitle = inputController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                    overlayColor: MaterialStateProperty.resolveWith((states) =>
                        states.contains(MaterialState.pressed)
                            ? Colors.transparent
                            : null),
                    shape:
                        MaterialStateProperty.all(const RoundedRectangleBorder(
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
    );
  }
}
