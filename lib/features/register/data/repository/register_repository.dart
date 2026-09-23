import 'package:dio/dio.dart';
import 'package:digitera_task1/core/network/api_constants.dart';
import 'package:digitera_task1/core/network/handle_dio_exceptions_service.dart';
import 'package:digitera_task1/core/network/result_api.dart';
import 'package:digitera_task1/features/register/data/model/user_model.dart';

class RegisterRepository {
  RegisterRepository(this._dio);

  final Dio _dio;

  Future<ResultApi<UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String avatar,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.users,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'avatar': avatar,
        },
      );
      return Success(UserModel.fromJson(response.data as Map<String, dynamic>));
    } on DioException catch (error) {
      return Error(HandleDioExceptionsService.handle(error));
    } catch (_) {
      return Error('Unable to create account');
    }
  }
}
