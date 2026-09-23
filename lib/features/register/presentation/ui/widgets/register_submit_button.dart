import 'package:digitera_task1/features/register/presentation/cubit/register_cubit.dart';
import 'package:digitera_task1/features/register/presentation/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterSubmitButton extends StatelessWidget {
  const RegisterSubmitButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) => FilledButton(
          onPressed: state is RegisterLoading ? null : onPressed,
          child: state is RegisterLoading
              ? const SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : const Text('Create account'),
        ),
      );
}
