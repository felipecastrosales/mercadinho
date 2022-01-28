import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

import 'components/custom_text_field.dart';
import 'package:mercadinho/src/config/custom_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
