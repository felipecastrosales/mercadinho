import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    this.initialValue,
    this.readOnly = false,
    this.keyboardType,
  });

  factory CustomTextField.email({
    String? initialValue,
    bool readOnly = false,
  }) {
    return CustomTextField(
      icon: Icons.email,
      label: 'Email',
      initialValue: initialValue,
      readOnly: readOnly,
      keyboardType: TextInputType.emailAddress,
    );
  }

  factory CustomTextField.password({
    String? initialValue,
    bool readOnly = false,
  }) {
    return CustomTextField(
      icon: Icons.lock,
      label: 'Password',
      initialValue: initialValue,
      readOnly: readOnly,
      isSecret: true,
    );
  }

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;
  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        initialValue: widget.initialValue,
        readOnly: widget.readOnly,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: isObscure
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                )
              : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
