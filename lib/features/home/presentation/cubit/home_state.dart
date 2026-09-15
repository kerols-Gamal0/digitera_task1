import 'package:digitera_task1/features/home/data/model/product_model.dart';

sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeSuccess extends HomeState {
  const HomeSuccess(this.products);
  final List<ProductModel> products;
}

final class HomeFailure extends HomeState {
  const HomeFailure(this.message);
  final String message;
}
