import 'package:digitera_task1/core/di/service_locator.dart';
import 'package:digitera_task1/features/category/data/model/category_model.dart';
import 'package:digitera_task1/features/category/presentation/cubit/category_cubit.dart';
import 'package:digitera_task1/features/category/presentation/cubit/category_state.dart';
import 'package:digitera_task1/features/category/presentation/ui/widgets/category_card.dart';
import 'package:digitera_task1/features/category/presentation/ui/widgets/category_failure.dart'
    as widgets;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => getIt<CategoryCubit>()..loadCategories(),
    child: const _CategoryContent(),
  );
}

class _CategoryContent extends StatelessWidget {
  const _CategoryContent();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Categories'),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.tune_rounded)),
      ],
    ),
    body: BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading || state is CategoryInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoryFailure) {
          return widgets.CategoryFailure(
            message: state.message,
            onRetry: () => context.read<CategoryCubit>().loadCategories(),
          );
        }
        final categories = state is CategorySuccess
            ? state.categories
            : <CategoryModel>[];
        return RefreshIndicator(
          onRefresh: context.read<CategoryCubit>().loadCategories,
          child: LayoutBuilder(
            builder: (_, constraints) {
              final columns = constraints.maxWidth > 900
                  ? 4
                  : constraints.maxWidth > 600
                  ? 3
                  : 2;
              return GridView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: .9,
                ),
                itemBuilder: (_, index) =>
                    CategoryCard(category: categories[index]),
              );
            },
          ),
        );
      },
    ),
  );
}
