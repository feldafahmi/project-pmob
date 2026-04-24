// ============================================
// FILE: lib/services/product_service.dart
// ============================================

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../config/api_config.dart';
import '../models/product_model.dart';
import 'api_service.dart';

class ProductService {
  /// Fetch produk Mark-Up dari Laravel.
  /// - [type] = 'modul' | 'kelas' | 'bootcamp' (null = semua, kecuali mentoring).
  /// - [sort] = 'terpopuler' | 'terbaru' | 'termurah'.
  Future<PaginatedProducts> fetchProducts({
    String? search,
    String? type,
    String sort = 'terpopuler',
    int page = 1,
  }) async {
    try {
      final query = <String, dynamic>{
        'page': page,
        'sort': sort,
      };
      if (search != null && search.trim().isNotEmpty) {
        query['search'] = search.trim();
      }
      if (type != null && type.isNotEmpty && type != 'semua') {
        query['type'] = type;
      }

      final response =
          await ApiService.dio.get(ApiConfig.products, queryParameters: query);

      if (kDebugMode) {
        debugPrint('[ProductService] GET ${ApiConfig.products} ?$query '
            '→ ${response.statusCode}');
      }

      if (response.statusCode == 200) {
        final body = response.data;
        if (body is Map<String, dynamic>) {
          return PaginatedProducts.fromJson(body);
        }
        if (body is List) {
          return PaginatedProducts.fromJson({'data': body});
        }
        throw Exception('Format respons tidak dikenal');
      }
      throw Exception('Gagal memuat produk (${response.statusCode})');
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint('[ProductService] DioException: ${e.type} '
            '${e.response?.statusCode} ${e.response?.data}');
      }
      throw Exception(_readableError(e));
    }
  }

  String _readableError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return 'Koneksi timeout, coba lagi.';
      case DioExceptionType.connectionError:
        return 'Tidak dapat terhubung ke server.';
      default:
        break;
    }
    final data = e.response?.data;
    if (data is Map && data['message'] is String) return data['message'];
    return 'Terjadi kesalahan, silakan coba lagi.';
  }
}
