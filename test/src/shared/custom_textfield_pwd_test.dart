import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:password_validation/src/shared/custom_textfield.dart';
import 'package:password_validation/src/shared/custom_textfield_pwd.dart';

void main() {
  group('Grupo de teste do TextFormField PWD', () {
    testWidgets('Renderizar corretamente o CustomTextField', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextfieldPwd(
              label: 'Teste',
              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(
        find.byType(CustomTextfield),
        findsOneWidget,
        reason: 'Deve ter um CustomTextfield',
      );
    });

    testWidgets('Exibe o label corretamente quando fornecido', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextfieldPwd(
              label: 'Teste',
              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      expect(find.byType(Text), findsOneWidget, reason: 'Deve ter um Text');
      expect(find.text('Teste'), findsOneWidget, reason: 'Deve ter o label');
    });

    testWidgets('Verificar se obscureText está configurado', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextfieldPwd(
              label: 'Teste',
              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      final textField = tester.widget<TextField>(find.byType(TextField));

      expect(
        textField.obscureText,
        isTrue,
        reason: 'obscureText deve ser true',
      );
    });

    testWidgets('Verificar se SuffixIcon está renderizando corretamente', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextfieldPwd(
              label: 'Teste',
              backgroundColor: Colors.white,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      TextField getTextField() =>
          tester.widget<TextField>(find.byType(TextField));

      expect(
        getTextField().obscureText,
        isTrue,
        reason: 'obscureText deve ser true',
      );

      await tester.tap(find.byIcon(Icons.visibility_outlined));
      await tester.pump();

      expect(
        getTextField().obscureText,
        isFalse,
        reason: 'obscureText deve ser false',
      );
      expect(
        find.byIcon(Icons.visibility_off_outlined),
        findsOneWidget,
        reason: 'O icone deve ser o visibility_off_outlined',
      );
      expect(
        find.byIcon(Icons.visibility_outlined),
        findsNothing,
        reason: 'O icone não deve ser o visibility_outlined',
      );

      await tester.tap(find.byIcon(Icons.visibility_off_outlined));
      await tester.pump();

      expect(
        getTextField().obscureText,
        isTrue,
        reason: 'obscureText deve ser true',
      );
      expect(
        find.byIcon(Icons.visibility_outlined),
        findsOneWidget,
        reason: 'O icone deve ser o visibility_outlined',
      );
      expect(
        find.byIcon(Icons.visibility_off_outlined),
        findsNothing,
        reason: 'O icone não deve ser o visibility_off_outlined',
      );
    });

    testWidgets('Verificar se controller está sendo preenchido', (
      WidgetTester tester,
    ) async {
      var controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextfieldPwd(
              label: 'Teste',
              backgroundColor: Colors.white,
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'Senha do usuário');
      await tester.pump();

      expect(
        controller.text,
        'Senha do usuário',
        reason: 'controller deve ser preenchido corretamente',
      );
    });
  });
}
