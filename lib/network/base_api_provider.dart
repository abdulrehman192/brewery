abstract class BaseApiProvider
{
  Future<dynamic> get({required String url, Map<String, dynamic>? queryParameters });
  Future<dynamic> post({required String url, Map<String, dynamic>? queryParameters, dynamic data });
  Future<dynamic> put({required String url, Map<String, dynamic>? queryParameters, dynamic data });
  Future<dynamic> patch({required String url, Map<String, dynamic>? queryParameters, dynamic data });
  Future<dynamic> delete({required String url, Map<String, dynamic>? queryParameters, dynamic data });
}