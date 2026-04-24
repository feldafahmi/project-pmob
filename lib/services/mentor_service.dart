// ============================================
// FILE: lib/services/mentor_service.dart
// ============================================

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../config/api_config.dart';
import '../models/mentor_model.dart';
import 'api_service.dart';

class MentorService {
  /// Fetch daftar mentor untuk section On-Demand Mentoring.
  /// [available] = filter berdasarkan ketersediaan mentor.
  Future<List<MentorModel>> fetchMentors({
    bool? available,
    int limit = 10,
  }) async {
    try {
      final query = <String, dynamic>{'limit': limit};
      if (available != null) query['available'] = available ? 1 : 0;

      final response =
          await ApiService.dio.get(ApiConfig.mentors, queryParameters: query);

      if (kDebugMode) {
        debugPrint('[MentorService] GET ${ApiConfig.mentors} ?$query '
            '→ ${response.statusCode}');
      }

      if (response.statusCode == 200) {
        final body = response.data;

        // Cari list di berbagai bentuk wrapper.
        List rawList = const [];
        if (body is List) {
          rawList = body;
        } else if (body is Map<String, dynamic>) {
          if (body['data'] is List) {
            rawList = body['data'] as List;
          } else if (body['data'] is Map &&
              (body['data'] as Map)['data'] is List) {
            rawList = (body['data'] as Map)['data'] as List;
          } else if (body['mentors'] is List) {
            rawList = body['mentors'] as List;
          }
        }

        return rawList
            .whereType<Map>()
            .map((e) => MentorModel.fromJson(Map<String, dynamic>.from(e)))
            .toList();
      }
      throw Exception('Gagal memuat mentor (${response.statusCode})');
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint('[MentorService] DioException: ${e.type} '
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
    return 'Terjadi kesalahan saat memuat mentor.';
  }
}
