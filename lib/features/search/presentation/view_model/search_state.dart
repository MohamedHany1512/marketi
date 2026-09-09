import 'package:marketi/features/home/data/models/product_model.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<ProductModel> products;
  final bool hasMore;
  SearchSuccessState({required this.products, required this.hasMore});
}

class SearchEmptyState extends SearchState {
  final String query;
  SearchEmptyState(this.query);
}

class SearchErrorState extends SearchState {
  final String error;
  SearchErrorState(this.error);
}

class SearchLoadingMoreState extends SearchState {}