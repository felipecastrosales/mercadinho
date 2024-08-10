import 'package:flutter/material.dart';
import 'package:mercadinho/src/pages/commom_widgets/buttons/app_button_type.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.type,
    required this.title,
    required this.onPressed,
  });

  final AppButtonType type;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final labelMedium = Theme.of(context).textTheme.labelMedium;
    final titleWidget = Text(title, style: labelMedium);

    void callBack() {
      onPressed();
    }

    final button = switch (type) {
      AppButtonType.elevated => ElevatedButton(
          onPressed: callBack,
          child: titleWidget,
        ),
      AppButtonType.outlined => OutlinedButton(
          onPressed: callBack,
          child: titleWidget,
        ),
    };

    return SizedBox(
      height: 50,
      child: button,
    );
  }
}
