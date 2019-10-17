import 'package:flutter/foundation.dart';

class transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  transaction(@required this.id, @required this.title, @required this.amount,
      @required this.date);

  static List<transaction> getTransactions() {
    List<transaction> transactions = [
      transaction("1", "Grocery", 34.0, DateTime.now()),
      transaction("2", "Mobile bill", 50.0, DateTime.now())
    ];

    return transactions;
  }
}
