import 'package:digitera_task1/core/network/result_api.dart';
import 'package:digitera_task1/features/category/data/model/category_model.dart';
import 'package:digitera_task1/features/category/data/repository/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._repository) : super(const CategoryInitial());
  final CategoryRepository _repository;

  Future<void> loadCategories() async {
    emit(const CategoryLoading());
    final result = await _repository.getCategories();
    if (result case Success<List<CategoryModel>>(:final data)) {
      emit(CategorySuccess(data));
    } else if (result case Error<List<CategoryModel>>(:final messageError)) {
      emit(CategoryFailure(messageError));
    }
  }
}
