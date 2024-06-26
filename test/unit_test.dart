import 'package:flutter_test/flutter_test.dart';

bool isValidEmail(String email) {
  RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    caseSensitive: false,
  );
  return emailRegExp.hasMatch(email);
}

void main() {
  group('Email Validation', () {
    test('Valid email returns true', () {
      expect(isValidEmail('test@example.com'), true);
    });

    test('w/o a domain', () {
      expect(isValidEmail('test@'), false);
    });

    test('w/o .com', () {
      expect(isValidEmail('test@example'), false);
    });

    test('With space inside a local-part', () {
      expect(isValidEmail('tes t@example.com'), false);
    });

    test('w/o a local-part', () {
      expect(isValidEmail('@example.com'), false);
    });
  });
}
