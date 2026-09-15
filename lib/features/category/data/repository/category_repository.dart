import 'package:digitera_task1/core/network/result_api.dart';
import 'package:digitera_task1/features/category/data/model/category_model.dart';
import 'package:digitera_task1/core/network/api_constants.dart';
import 'package:digitera_task1/core/network/handle_dio_exceptions_service.dart';
import 'package:dio/dio.dart';

class CategoryRepository {
  CategoryRepository(this._dio);

  final Dio _dio;

  Future<ResultApi<List<CategoryModel>>> getCategories() async {
    try {
      final response = await _dio.get(ApiConstants.categories);
      final data = response.data as List<dynamic>;
      return Success(
        data.map((item) {
          return CategoryModel.fromJson(item as Map<String, dynamic>);
        }).toList(),
      );
    } on DioException catch (error) {
      return Error(HandleDioExceptionsService.handle(error));
    } catch (_) {
      return Error('Unable to load categories');
    }
  }
}
