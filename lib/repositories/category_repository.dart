import 'package:dio/dio.dart';
import 'package:finice/models/category_model.dart';
import 'package:finice/services/api_client.dart';

class CategoryRepository {
  final Dio _dio = ApiClient().dio;

  Future<void> createCategory(CategoryModel category) async {
    try {
      await _dio.post('/category', data: category.toJson());
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['message'] ?? "Gagal terhubung ke server";
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception("Terjadi kesalahan yang tidak diketahui");
    }
  }

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await _dio.get('/category');

      final List data = response.data['data'] ?? response.data;

      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? "Gagal memuat data");
    } catch (e) {
      throw Exception("Terjadi kesalahan sistem");
    }
  }

  Future<void> updateCategory(CategoryModel category) async {
    try {
      await _dio.post('/category/${category.id}', data: category.toJson('PUT'));
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['message'] ?? "Gagal terhubung ke server";
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception("Terjadi kesalahan yang tidak diketahui");
    }
  }

  Future<void> deleteCategory(int id) async {
    // final Map<String, dynamic> data = {'id': id, 'method': 'DELETE'};
    try {
      await _dio.post('/category/$id', data: {'_method': 'DELETE'});
    } on DioException catch (e) {
      String errorMessage =
          e.response?.data['message'] ?? "Gagal terhubung ke server";
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception("Terjadi kesalahan yang tidak diketahui");
    }

    return;
  }
}
