import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('String Calculator', () {
    test('returns 0 for empty string', () {
      expect(add(''), equals(0));
    });

    test('returns number for single value', () {
      expect(add('1'), equals(1));
    });

    test('adds multiple comma-separated numbers', () {
      expect(add('1,2,3'), equals(6));
    });

    test('supports new lines as delimiters', () {
      expect(add('1\n2,3'), equals(6));
      expect(add('1\n2\n3'), equals(6));
    });

    test('throws exception for a negative number', () {
      expect(
            () => add('1,-2,3'),
        throwsA(isA<Exception>()),
      );
    });

    test('exception message lists all negative numbers', () {
      expect(
            () => add('-1,-2,3'),
        throwsA(
          predicate(
                (e) =>
            e is Exception &&
                e.toString().contains('[-1, -2]'),
          ),
        ),
      );
    });
  });
}
