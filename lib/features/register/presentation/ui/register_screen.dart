import 'package:digitera_task1/core/di/service_locator.dart';
import 'package:digitera_task1/core/routes/app_routes.dart';
import 'package:digitera_task1/core/storage/app_preferences.dart';
import 'package:digitera_task1/features/register/presentation/cubit/register_cubit.dart';
import 'package:digitera_task1/features/register/presentation/cubit/register_state.dart';
import 'package:digitera_task1/features/register/presentation/ui/widgets/register_header.dart';
import 'package:digitera_task1/features/register/presentation/ui/widgets/register_submit_button.dart';
import 'package:digitera_task1/features/register/presentation/ui/widgets/register_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => getIt<RegisterCubit>(),
    child: const _RegisterContent(),
  );
}

class _RegisterContent extends StatefulWidget {
  const _RegisterContent();

  @override
  State<_RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<_RegisterContent> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final avatarController = TextEditingController(
    text: 'https://api.lorem.space/image/face?w=640&h=480',
  );
  bool obscurePassword = true;
  bool obscureConfirmation = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    avatarController.dispose();
    super.dispose();
  }

  void submit() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    context.read<RegisterCubit>().register(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
      avatar: avatarController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Create account')),
    body: BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) async {
        if (state case RegisterSuccess(:final user)) {
          await AppPreferences.setLoggedIn(true);
          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Welcome, ${user.name ?? 'customer'}!')),
          );
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
        } else if (state case RegisterFailure(:final message)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const RegisterHeader(),
                    const SizedBox(height: 28),
                    RegisterTextField(
                      controller: nameController,
                      label: 'Name',
                      icon: Icons.person_outline_rounded,
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                          ? 'Please enter your name'
                          : null,
                    ),
                    const SizedBox(height: 14),
                    RegisterTextField(
                      controller: emailController,
                      label: 'Email',
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        final email = value?.trim() ?? '';
                        if (email.isEmpty) return 'Please enter your email';
                        final emailRegex = RegExp(
                          r"^[A-Za-z0-9.!#$%&'*+/=?^_`{|}~-]+@[A-Za-z0-9-]+(?:\.[A-Za-z0-9-]+)+$",
                        );
                        if (!emailRegex.hasMatch(email)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),
                    RegisterTextField(
                      controller: passwordController,
                      label: 'Password',
                      icon: Icons.lock_outline_rounded,
                      obscureText: obscurePassword,
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => obscurePassword = !obscurePassword),
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      validator: (value) => (value?.length ?? 0) < 6
                          ? 'Password must be at least 6 characters'
                          : null,
                    ),
                    const SizedBox(height: 14),
                    RegisterTextField(
                      controller: confirmPasswordController,
                      label: 'Confirm password',
                      icon: Icons.lock_reset_outlined,
                      obscureText: obscureConfirmation,
                      suffixIcon: IconButton(
                        onPressed: () => setState(
                          () => obscureConfirmation = !obscureConfirmation,
                        ),
                        icon: Icon(
                          obscureConfirmation
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      validator: (value) => value != passwordController.text
                          ? 'Passwords do not match'
                          : null,
                    ),
                    const SizedBox(height: 14),
                    RegisterTextField(
                      controller: avatarController,
                      label: 'Avatar URL',
                      icon: Icons.image_outlined,
                      keyboardType: TextInputType.url,
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                          ? 'Please enter an avatar URL'
                          : null,
                    ),
                    const SizedBox(height: 24),
                    RegisterSubmitButton(onPressed: submit),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
