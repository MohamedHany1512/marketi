import 'package:flutter/material.dart';
import 'package:marketi/features/auth/login/presentation/view_model/login_state.dart';
import 'package:marketi/features/auth/login/presentation/views/widgets/login_button.dart';
import 'package:marketi/features/auth/login/presentation/views/widgets/login_logo.dart';
import 'package:marketi/features/auth/login/presentation/views/widgets/login_text_field.dart';
import 'package:marketi/features/auth/login/presentation/views/widgets/register_prompt.dart';
import 'package:marketi/features/auth/login/presentation/views/widgets/remember_me_row.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.state,
    required this.emailController,
    required this.passwordController,
    required this.onTogglePassword,
    required this.onToggleRememberMe,
    required this.onLogin,
  });

  final LoginState state;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onTogglePassword;
  final VoidCallback onToggleRememberMe;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const LoginLogo(),
          const SizedBox(height: 30),

          LoginTextField(
            controller: emailController,
            hintText: 'Email',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),

          LoginTextField(
            controller: passwordController,
            hintText: 'Password',
            icon: Icons.lock_outline,
            obscureText: state.obscurePassword,
            suffixIcon: IconButton(
              onPressed: onTogglePassword,
              icon: Icon(
                state.obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
          ),

          RememberMeRow(
            value: state.rememberMe,
            onChanged: onToggleRememberMe,
          ),
          const SizedBox(height: 10),

          LoginButton(
            isLoading: state.isLoading,
            onPressed: onLogin,
          ),

          const SizedBox(height: 20),
          const RegisterPrompt(),
        ],
      ),
    );
  }
}

