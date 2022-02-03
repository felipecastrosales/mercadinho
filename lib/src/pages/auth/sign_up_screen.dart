import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../commom_widgets/custom_text_field.dart';
import 'package:mercadinho/src/config/custom_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );
    final phoneFormatter = MaskTextInputFormatter(
      mask: '## # ####-####',
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextField(
                          icon: Icons.email,
                          label: 'Email',
                        ),
                        const CustomTextField(
                          icon: Icons.lock,
                          label: 'Password',
                          isSecret: true,
                        ),
                        const CustomTextField(
                          icon: Icons.person,
                          label: 'Name',
                        ),
                        CustomTextField(
                          icon: Icons.phone,
                          label: 'Phone',
                          inputFormatters: [phoneFormatter],
                        ),
                        CustomTextField(
                          icon: Icons.file_copy,
                          label: 'CPF',
                          inputFormatters: [cpfFormatter],
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: const Text(
                              'Register User',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
