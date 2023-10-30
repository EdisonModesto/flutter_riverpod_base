import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppFieldEmail(controller: emailCtrl),
        const SizedBox(
          height: 20,
        ),
        AppFieldPassword(controller: passwordCtrl),
        const SizedBox(
          height: 50,
        ),
        AppButtonFlat(
          bgColor: AppColors().primary,
          fgColor: AppColors().white,
          text: "Login",
          onTap: () {
            final auth = ref.watch(authControllerProvider);
            auth.signInEmail(emailCtrl.text, passwordCtrl.text);
          },
        ),
      ],
    );
  }
}
