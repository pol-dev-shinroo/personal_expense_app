// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputFields extends StatelessWidget {
  final Function addTransaction;

  TextInputFields({super.key, required this.addTransaction});

  final inputController = TextEditingController();
  final amountController = TextEditingController();

  void _addTransactionHanlder() {
    if (inputController.text != "" && amountController.text != "") {
      addTransaction(inputController.text, double.parse(amountController.text));
    }
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
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              onPressed: _addTransactionHanlder,
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
