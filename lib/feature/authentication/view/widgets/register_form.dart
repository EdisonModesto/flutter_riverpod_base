import 'package:async_button/async_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../commons/views/widgets/buttons.dart';
import '../../../../commons/views/widgets/fields.dart';
import '../../../../res/themes.dart';
import '../../controller/auth_controller.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  AsyncBtnStatesController btnStateController = AsyncBtnStatesController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppFieldEmail(controller: emailCtrl),
          const SizedBox(height: 20),
          AppFieldPassword(controller: passwordCtrl, isRegister: true),
          const SizedBox(height: 50),
          AsyncButtonFlat(
            asyncBtnStatesController: btnStateController,
            bgColor: AppColors().primary,
            fgColor: AppColors().white,
            text: "Signup",
            onTap: () async {
              if (formKey.currentState!.validate()) {
                btnStateController.update(AsyncBtnState.loading);

                try {
                  final auth = ref.watch(authControllerProvider);
                  await auth.signUpEmail(emailCtrl.text, passwordCtrl.text);
                  EasyLoading.showSuccess('Welcome Back');
                  btnStateController.update(AsyncBtnState.success);
                } catch (e) {
                  btnStateController.update(AsyncBtnState.failure);
                }
              } else {
                EasyLoading.showError('Please fill all fields');
              }
            },
          ),
        ],
      ),
    );
  }
}
