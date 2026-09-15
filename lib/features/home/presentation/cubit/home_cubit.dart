import 'package:digitera_task1/core/network/result_api.dart';
import 'package:digitera_task1/features/home/data/model/product_model.dart';
import 'package:digitera_task1/features/home/data/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository) : super(const HomeInitial());
  final HomeRepository _repository;

  Future<void> loadProducts() async {
    emit(const HomeLoading());
    final result = await _repository.getProducts();
    if (result case Success<List<ProductModel>>(:final data)) {
      emit(HomeSuccess(data));
    } else if (result case Error<List<ProductModel>>(:final messageError)) {
      emit(HomeFailure(messageError));
    }
  }
}
