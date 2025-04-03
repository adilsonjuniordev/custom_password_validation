import 'package:flutter/material.dart';
import 'package:password_validation/src/shared/colors_app.dart';

typedef UpdateMatchCallback = void Function(ValueKey<int> key, bool match);

class PasswordDotValidationWidget extends StatelessWidget {
  const PasswordDotValidationWidget({
    required super.key,
    required this.label,
    required this.patternValidation,
    required this.passwordValue,
    required this.updateMatch,
  });

  final String label;
  final String patternValidation;
  final ValueNotifier<String> passwordValue;
  final UpdateMatchCallback updateMatch;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: passwordValue,
      builder: (_, passwordText, _) {
        final valid = RegExp(patternValidation).hasMatch(passwordText);
        updateMatch(super.key as ValueKey<int>, valid);

        return Row(
          spacing: 8,
          children: [
            Container(
              height: 13,
              width: 13,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Visibility(
                visible: valid,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: coolGreyColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
