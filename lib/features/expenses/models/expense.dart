import 'package:flutter/foundation.dart';

class Expense {
  final String id;
  final double amount;
  final String currency; // 'USD' or 'KHR'
  final double khrAmount; // Calculated amount in KHR
  final double usdAmount; // Calculated amount in USD
  final String category;
  final String paymentMethod;
  final DateTime date;
  final String? notes;

  Expense({
    required this.id,
    required this.amount,
    required this.currency,
    required this.khrAmount,
    required this.usdAmount,
    required this.category,
    required this.paymentMethod,
    required this.date,
    this.notes,
  });
}
