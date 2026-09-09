import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/common/debouncer.dart';
import 'package:marketi/features/home/data/models/product_model.dart';
import 'package:marketi/features/search/data/repos/search_repo.dart';
import 'package:marketi/features/search/presentation/view_model/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  final Debouncer debouncer = Debouncer(delay: const Duration(milliseconds: 500));

  SearchCubit(this.searchRepo) : super(SearchInitialState());

  List<ProductModel> products = [];
  String currentQuery = '';
  int currentPage = 1;
  bool hasMore = true;
  bool isLoadingMore = false;

  void onSearchChanged(String query) {
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      debouncer.cancel();
      products.clear();
      currentQuery = '';
      emit(SearchInitialState());
      return;
    }

    debouncer.run(() {
      searchProducts(query: trimmed);
    });
  }

  Future<void> searchProducts({required String query}) async {
    currentQuery = query;
    currentPage = 1;
    hasMore = true;
    products.clear();

    emit(SearchLoadingState());

    final result = await searchRepo.searchProducts(query: query, page: currentPage);

    result.fold(
      (error) => emit(SearchErrorState(error)),
      (newProducts) {
        if (newProducts.isEmpty) {
          emit(SearchEmptyState(query));
        } else {
          products = newProducts;
          hasMore = newProducts.length >= 10;
          emit(SearchSuccessState(products: products, hasMore: hasMore));
        }
      },
    );
  }

  Future<void> loadMoreProducts() async {
    if (isLoadingMore || !hasMore || currentQuery.isEmpty) return;

    isLoadingMore = true;
    emit(SearchLoadingMoreState());

    currentPage++;
    final result = await searchRepo.searchProducts(query: currentQuery, page: currentPage);

    result.fold(
      (error) {
        isLoadingMore = false;
        currentPage--;
        emit(SearchSuccessState(products: products, hasMore: hasMore));
      },
      (newProducts) {
        isLoadingMore = false;
        if (newProducts.isEmpty) {
          hasMore = false;
        } else {
          products.addAll(newProducts);
          hasMore = newProducts.length >= 10;
        }
        emit(SearchSuccessState(products: products, hasMore: hasMore));
      },
    );
  }

  @override
  Future<void> close() {
    debouncer.cancel();
    return super.close();
  }
}