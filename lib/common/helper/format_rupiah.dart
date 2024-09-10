import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class FormatRupiah extends TextInputFormatter {
  final NumberFormat _formatter =
      NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    final newNumber = int.parse(newText);

    final formattedText = _formatter.format(newNumber);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
