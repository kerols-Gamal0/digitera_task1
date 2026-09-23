import 'package:digitera_task1/core/network/result_api.dart';
import 'package:digitera_task1/features/register/data/model/user_model.dart';
import 'package:digitera_task1/features/register/data/repository/register_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._repository) : super(const RegisterInitial());

  final RegisterRepository _repository;

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String avatar,
  }) async {
    emit(const RegisterLoading());
    final result = await _repository.register(
      name: name,
      email: email,
      password: password,
      avatar: avatar,
    );
    if (result case Success<UserModel>(:final data)) {
      emit(RegisterSuccess(data));
    } else if (result case Error<UserModel>(:final messageError)) {
      emit(RegisterFailure(messageError));
    }
  }
}
