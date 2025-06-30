import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'api_client.dart';

final GetIt getCoreIt=GetIt.instance;

Future<void> coreSetupLocator() async {
  getCoreIt.registerSingleton<ApiClient>(ApiClient(client: http.Client()));
}