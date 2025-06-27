import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/utils/value_validator.dart';

class AppFieldEmail extends ConsumerStatefulWidget {
  const AppFieldEmail({super.key, required this.controller});
  final TextEditingController controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppFieldEmailState();
}

class _AppFieldEmailState extends ConsumerState<AppFieldEmail> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (ValueValidator.isValidEmail(value ?? '')) {
          return null;
        }
        return 'Please enter a valid email';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        hintText: "Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}

class AppFieldPassword extends ConsumerStatefulWidget {
  const AppFieldPassword({super.key, required this.controller, this.isRegister});
  final TextEditingController controller;
  final bool? isRegister;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppFieldPasswordState();
}

class _AppFieldPasswordState extends ConsumerState<AppFieldPassword> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (ValueValidator.isValidPassword(value ?? '')) {
          return null;
        }

        if (widget.isRegister == true) {
          return 'The password must be:\n- at least 8 characters long\n- at least 1 uppercase letter\n- contains 1 lowercase letter\n- contains 1 digit.';
        }
        return 'Please enter a valid password';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isObscured,
      decoration: InputDecoration(
        hintText: "Password",
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: InkWell(
          radius: 100,
          onTap: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
          child: Icon(isObscured ? Icons.visibility_off : Icons.visibility),
        ),
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
