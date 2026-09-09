import 'package:dartz/dartz.dart';
import 'package:marketi/core/network/api/api_consumer.dart';
import 'package:marketi/core/network/api/end_points.dart';
import 'package:marketi/features/home/data/models/product_model.dart';

abstract class SearchRepo {
  Future<Either<String, List<ProductModel>>> searchProducts({
    required String query,
    required int page,
  });
}

class SearchRepoImpl implements SearchRepo {
  final ApiConsumer api;
  SearchRepoImpl(this.api);

  @override
  Future<Either<String, List<ProductModel>>> searchProducts({
    required String query,
    required int page,
  }) async {
    try {
      final response = await api.get(
        EndPoint.homeProducts,
        queryParameters: {'skip': 0, 'limit': 100},
      );
      final listJson = response['list'] as List? ?? const [];
      final normalizedQuery = query.toLowerCase();
      final products = listJson
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .where(
            (product) =>
                product.title.toLowerCase().contains(normalizedQuery) ||
                product.category.toLowerCase().contains(normalizedQuery) ||
                product.brand.toLowerCase().contains(normalizedQuery),
          )
          .toList();

      final start = (page - 1) * 10;
      if (start >= products.length) return const Right([]);

      final end = (start + 10).clamp(0, products.length);
      return Right(products.sublist(start, end));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
