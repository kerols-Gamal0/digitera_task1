import 'package:digitera_task1/core/di/service_locator.dart';
import 'package:digitera_task1/core/routes/app_routes.dart';
import 'package:digitera_task1/features/home/data/model/product_model.dart';
import 'package:digitera_task1/features/home/presentation/cubit/home_cubit.dart';
import 'package:digitera_task1/features/home/presentation/cubit/home_state.dart';
import 'package:digitera_task1/features/home/presentation/ui/widgets/home_failure.dart'
    as widgets;
import 'package:digitera_task1/features/home/presentation/ui/widgets/home_header.dart';
import 'package:digitera_task1/features/home/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => getIt<HomeCubit>()..loadProducts(),
    child: const _HomeContent(),
  );
}

class _HomeContent extends StatefulWidget {
  const _HomeContent();
  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  final searchController = TextEditingController();
  String query = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Digitera Market'),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, AppRoutes.register),
          icon: const Icon(Icons.person_add_alt_1_outlined),
          tooltip: 'Create account',
        ),
      ],
    ),
    body: BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading || state is HomeInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is HomeFailure) {
          return widgets.HomeFailure(
            message: state.message,
            onRetry: () => context.read<HomeCubit>().loadProducts(),
          );
        }
        final products = state is HomeSuccess
            ? state.products
                  .where(
                    (item) => (item.title ?? '').toLowerCase().contains(query),
                  )
                  .toList()
            : <ProductModel>[];
        return RefreshIndicator(
          onRefresh: context.read<HomeCubit>().loadProducts,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: HomeHeader(
                  controller: searchController,
                  onChanged: (value) =>
                      setState(() => query = value.toLowerCase()),
                ),
              ),
              if (products.isEmpty)
                const SliverFillRemaining(
                  child: Center(child: Text('No products found')),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                  sliver: SliverLayoutBuilder(
                    builder: (_, constraints) {
                      final columns = constraints.crossAxisExtent > 900
                          ? 4
                          : constraints.crossAxisExtent > 600
                          ? 3
                          : 2;
                      return SliverGrid.builder(
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 14,
                          childAspectRatio: .68,
                        ),
                        itemBuilder: (_, index) =>
                            ProductCard(product: products[index]),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    ),
  );
}
