import 'package:dio/dio.dart';

class LocationService {
  static final Dio _dio = Dio();

  static Future<Map<String, String>> getLocation() async {
    final fallbackApis = [
      _getFromIpApi,
      _getFromIpWhoIs,
      _getFromIpInfo,
    ];

    for (final apiCall in fallbackApis) {
      try {
        final result = await apiCall();
        if (result != null) return result;
      } catch (_) {
        // Silently fail and move to the next API
      }
    }

    // All attempts failed
    return {
      'countryCode': 'Unknown',
      'city': 'Unknown',
    };
  }

  static Future<Map<String, String>?> _getFromIpApi() async {
    final response = await _dio.get('http://ip-api.com/json/');
    if (response.statusCode == 200 && response.data['status'] == 'success') {
      return {
        'countryCode': response.data['countryCode'] ?? 'Unknown',
        'city': response.data['city'] ?? 'Unknown',
      };
    }
    return null;
  }

  static Future<Map<String, String>?> _getFromIpWhoIs() async {
    final response = await _dio.get('https://ipwho.is/');
    if (response.statusCode == 200 && response.data['success'] == true) {
      return {
        'countryCode': response.data['country_code'] ?? 'Unknown',
        'city': response.data['city'] ?? 'Unknown',
      };
    }
    return null;
  }

  static Future<Map<String, String>?> _getFromIpInfo() async {
    final response = await _dio.get('https://ipinfo.io/json');
    if (response.statusCode == 200) {
      return {
        'countryCode': response.data['country'] ?? 'Unknown',
        'city': response.data['city'] ?? 'Unknown',
      };
    }
    return null;
  }
}
