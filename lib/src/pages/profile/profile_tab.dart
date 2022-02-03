import 'package:flutter/material.dart';

import 'package:mercadinho/src/pages/commom_widgets/custom_text_field.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

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
        children: const [
          CustomTextField(
            icon: Icons.email,
            label: 'Email',
          ),
          CustomTextField(
            icon: Icons.person,
            label: 'Name',
          ),
          CustomTextField(
            icon: Icons.phone,
            label: 'Phone',
          ),
          CustomTextField(
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
          ),
          CustomTextField(
            icon: Icons.email,
            label: 'Email',
          ),
        ],
      ),
    );
  }
}
