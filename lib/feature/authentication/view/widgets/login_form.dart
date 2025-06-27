import 'package:async_button/async_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_base/utils/logger.dart';

import '../../../../commons/views/widgets/buttons.dart';
import '../../../../commons/views/widgets/fields.dart';
import '../../../../res/themes.dart';
import '../../controller/auth_controller.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
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
          AppFieldPassword(controller: passwordCtrl),
          const SizedBox(height: 50),
          AsyncButtonFlat(
            asyncBtnStatesController: btnStateController,
            bgColor: AppColors().primary,
            fgColor: AppColors().white,
            text: "Login",
            onTap: () async {
              if (formKey.currentState!.validate()) {
                btnStateController.update(AsyncBtnState.loading);

                try {
                  final auth = ref.read(authControllerProvider);
                  var result = await auth.signInEmail(emailCtrl.text, passwordCtrl.text);
                  Log().info(result.runtimeType.toString());
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
