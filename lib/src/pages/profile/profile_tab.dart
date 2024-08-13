import 'package:flutter/material.dart';

import 'package:mercadinho/src/config/app_data.dart' as appData;
import 'package:mercadinho/src/pages/commom_widgets/buttons/app_button.dart';
import 'package:mercadinho/src/pages/commom_widgets/buttons/app_button_type.dart';
import 'package:mercadinho/src/pages/commom_widgets/custom_text_field.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.email,
            icon: Icons.email,
            label: 'Email',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.name,
            icon: Icons.person,
            label: 'Name',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.phone,
            icon: Icons.phone,
            label: 'Phone',
          ),
          CustomTextField(
            readOnly: true,
            initialValue: appData.user.cpf,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),
          AppButton(
            type: AppButtonType.outlined,
            title: 'Update password',
            onPressed: () {
              updatePassword();
            },
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Update password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const CustomTextField(
                        icon: Icons.lock,
                        label: 'Actual password',
                        isSecret: true,
                      ),
                      const CustomTextField(
                        icon: Icons.lock_outlined,
                        label: 'New password',
                        isSecret: true,
                      ),
                      const CustomTextField(
                        icon: Icons.lock_outlined,
                        label: 'Confirm password',
                        isSecret: true,
                      ),
                      AppButton(
                        type: AppButtonType.elevated,
                        title: 'Update',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
