import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/services/services_locator.dart';
import 'package:marketi/features/home/presentation/view/widgets/product_card_widget.dart';
import 'package:marketi/features/search/presentation/view_model/search_cubit.dart';
import 'package:marketi/features/search/presentation/view_model/search_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ScrollController scrollController = ScrollController();
  late final SearchCubit searchCubit;

  @override
  void initState() {
    super.initState();
    searchCubit = sl<SearchCubit>();
    scrollController.addListener(onScroll);
  }

  void onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      searchCubit.loadMoreProducts();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: searchCubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Search Products'), centerTitle: true),
        body: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: (val) =>
                        context.read<SearchCubit>().onSearchChanged(val),
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        final cubit = context.read<SearchCubit>();

                        if (state is SearchLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is SearchErrorState) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(state.error),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () => cubit.searchProducts(
                                    query: cubit.currentQuery,
                                  ),
                                  child: const Text('Retry'),
                                ),
                              ],
                            ),
                          );
                        }

                        if (state is SearchEmptyState) {
                          return Center(
                            child: Text(
                              'No products found matching "${state.query}"',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }

                        if (state is SearchInitialState) {
                          return const Center(
                            child: Text(
                              'Type something to start searching',
                              style: TextStyle(color: Colors.grey),
                            ),
                          );
                        }

                        return Column(
                          children: [
                            Expanded(
                              child: GridView.builder(
                                controller: scrollController,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.7,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 12,
                                    ),
                                itemCount: cubit.products.length,
                                itemBuilder: (context, index) {
                                  final product = cubit.products[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.productDetails,
                                        arguments: product,
                                      );
                                    },
                                    child: ProductCardWidget(product: product),
                                  );
                                },
                              ),
                            ),
                            if (state is SearchLoadingMoreState)
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
