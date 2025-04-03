import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:password_validation/src/pages/widgets/password_dot_validation_widget.dart';

class MockUpdateMatchCallback extends Mock {
  void call(ValueKey<int> key, bool match);
}

void main() {
  group('Testando PasswordDotValidationWidget', () {
    testWidgets('Teste sucesso quando senha é correta', (tester) async {
      final mockUpdateMatch = MockUpdateMatchCallback();

      registerFallbackValue(ValueKey(0));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordDotValidationWidget(
              key: ValueKey(1),
              label: 'Somente números',
              patternValidation: r'^[0-9]+$',
              passwordValue: ValueNotifier('12345'),
              updateMatch: mockUpdateMatch.call,
            ),
          ),
        ),
      );

      final checked = tester.widget<Visibility>(find.byType(Visibility));

      verify(() => mockUpdateMatch.call(ValueKey(1), true)).called(1);
      expect(checked.visible, true);
    });

    testWidgets('Teste sucesso quando senha é incorreta', (tester) async {
      final mockUpdateMatch = MockUpdateMatchCallback();

      registerFallbackValue(ValueKey(0));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordDotValidationWidget(
              key: ValueKey(1),
              label: 'Somente números',
              patternValidation: r'^[0-9]+$',
              passwordValue: ValueNotifier('ABCDE'),
              updateMatch: mockUpdateMatch.call,
            ),
          ),
        ),
      );

      final checked = tester.widget<Visibility>(find.byType(Visibility));

      verify(() => mockUpdateMatch.call(ValueKey(1), false)).called(1);
      expect(checked.visible, false);
    });
  });
}
