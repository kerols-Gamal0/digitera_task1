import 'package:digitera_task1/features/category/data/model/category_model.dart';

sealed class CategoryState {
  const CategoryState();
}

final class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

final class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

final class CategorySuccess extends CategoryState {
  const CategorySuccess(this.categories);
  final List<CategoryModel> categories;
}

final class CategoryFailure extends CategoryState {
  const CategoryFailure(this.message);
  final String message;
}
