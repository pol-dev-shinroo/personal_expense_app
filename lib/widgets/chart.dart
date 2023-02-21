// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import "../models/transaction.dart";
import "./chart_bar.dart";

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart({super.key, required this.recentTransactions});

// key is string, value is object
// Map is like the hashMap (object)
  List<Map<String, Object>> get groupTransactionsValue {
    return List.generate(7, (idx) {
      final weekDay = DateTime.now().subtract(
        Duration(days: idx),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalSum);

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    });
  }

  double get totalSpending {
    return groupTransactionsValue.fold(0.0, (sum, item) {
      return sum + (item["amount"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionsValue);
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionsValue.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data["day"] as String,
                spendingAmount: data["amount"] as double,
                spendingPercentageTotal: totalSpending != 0
                    ? (data["amount"] as double) / totalSpending
                    : 0,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
