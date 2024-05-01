abstract class ApiConsumer {
  Future<dynamic> get(String path,
      {Object? data, Map<String, dynamic>? qureyparamer});
  Future<dynamic> post(String path,
      {Object? data, Map<String, dynamic>? qureyparamer, bool isForm = false});
  Future<dynamic> patch(String path,
      {Object? data, Map<String, dynamic>? qureyparamer, bool isForm = false});
  Future<dynamic> delete(String path,
      {Object? data, Map<String, dynamic>? qureyparamer, bool isForm = false});
}
