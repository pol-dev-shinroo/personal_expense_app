import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputFields extends StatelessWidget {
  TextInputFields({super.key});

  final inputController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              // onChanged: (value) {
              //   titleInput = value;
              // },
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
            TextField(
              controller: amountController,
              // onChanged: (value) {
              //   amountInput = value;
              // },
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                // ignore: avoid_print
                print(inputController.text);
                // print(titleInput);
                // ignore: avoid_print
                print(amountController.text);
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
