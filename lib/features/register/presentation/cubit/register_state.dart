import 'package:digitera_task1/features/register/data/model/user_model.dart';

sealed class RegisterState {
  const RegisterState();
}

final class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

final class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

final class RegisterSuccess extends RegisterState {
  const RegisterSuccess(this.user);
  final UserModel user;
}

final class RegisterFailure extends RegisterState {
  const RegisterFailure(this.message);
  final String message;
}
