import 'package:chopper/chopper.dart';

import 'apiservice.dart';
import 'header_interceptor.dart';

final Repository repository = Repository();

class Repository {
  ChopperClient chopper;

  Repository([String baseUrl]) {
    chopper = ChopperClient(services: [
      ApiService.create()
    ], interceptors: [
      AuthHeaderInterceptor(),
      HttpLoggingInterceptor(),
    ], converter: JsonConverter());
  }

  Future<Response> fetchAllProjects() {
    final myService = chopper.getService<ApiService>();
    return myService.fetchAllProjects();
  }
}
