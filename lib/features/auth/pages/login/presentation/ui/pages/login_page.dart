import 'package:almuhafiz_teachers/features/auth/pages/login/presentation/ui/widgets/login_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoginBody(),
    );
  }
}
