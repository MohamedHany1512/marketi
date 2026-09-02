import 'package:dartz/dartz.dart';
import 'package:marketi/features/home/data/models/product_model.dart';

import '../../../../core/network/api/api_consumer.dart';
import '../models/brand_model.dart';
import '../models/category_model.dart';

abstract class ProductsRepo {
  Future<Either<String, List<CategoryModel>>> getCategories();
  Future<Either<String, List<BrandModel>>> getBrands();
  Future<Either<String, List<ProductModel>>> getProducts({required int page});
}

class ProductsRepoImpl implements ProductsRepo {
  final ApiConsumer apiConsumer;

  ProductsRepoImpl({required this.apiConsumer});

  @override
  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      final response = await apiConsumer.get('/home/categories');
      final list = (response['list'] as List)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(list);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<BrandModel>>> getBrands() async {
    try {
      final response = await apiConsumer.get('/home/brands');
      final list = (response['list'] as List)
          .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(list);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
 @override
Future<Either<String, List<ProductModel>>> getProducts({required int page}) async {
  try {
    // حساب الـ skip بناءً على رقم الصفحة (الصفحة الأولى skip = 0)
    final int limit = 10;
    final int skip = (page - 1) * limit;

    final response = await apiConsumer.get(
      '/home/products',
      queryParameters: {
        'skip': skip,  // 👈 تعديل اسم البرامتر لـ skip
        'limit': limit,
      },
    );

    final list = (response['list'] as List)
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return Right(list);
  } catch (e) {
    return Left(e.toString());
  }
}
}