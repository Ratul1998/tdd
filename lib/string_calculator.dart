int add(String numbers) {
  if (numbers.isEmpty) return 0;

  final values = numbers
      .split(RegExp(r'[,\n]'))
      .map(int.parse)
      .toList();

  final negatives = values.where((n) => n < 0).toList();
  if (negatives.isNotEmpty) {
    throw Exception('Negative numbers not allowed: $negatives');
  }

  return values.fold(0, (sum, value) => sum + value);
}
