import 'package:http/http.dart' as http;
import 'package:movies_explorer/core/constants.dart' as constants;

class ApiClient {

  final http.Client client;

  ApiClient({required this.client});

  Future<http.Response> get(String path) async {
    final fullUrl = Uri.parse('${constants.baseUrl}$path');
    return await client.get(fullUrl, headers: _defaultHeaders());
  }

  Map<String, String> _defaultHeaders() =>
      {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${constants.token}', // if needed
      };

}
