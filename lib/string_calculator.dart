int add(String numbers) {
  if (numbers.isEmpty) return 0;

  return numbers
      .split(RegExp(r'[,\n]'))
      .map(int.parse)
      .fold(0, (sum, value) => sum + value);
}
