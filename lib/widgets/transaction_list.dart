import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "../models/transaction.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteFn;

  const TransactionList(
      {super.key, required this.transactions, required this.deleteFn});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900,
      // List view is a column with a scroll + the height is infinite
      // since the height is infinite, you need to set height for the Container (needs a warpper)
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    "No transactions added yet!",
                    style: TextStyle(
                        fontFamily: "Quicksand", fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, idx) {
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[idx].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[idx].title,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[idx].date),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.error,
                      onPressed: () => deleteFn(transactions[idx].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
