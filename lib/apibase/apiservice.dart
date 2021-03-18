import 'dart:async';

import 'package:chopper/chopper.dart';

part 'apiservice.chopper.dart';

@ChopperApi(baseUrl: 'https://api.todoist.com/rest/v1')
abstract class ApiService extends ChopperService {
  static ApiService create([ChopperClient client]) => _$ApiService(client);

  @Get(path: '/projects')
  Future<Response> fetchAllProjects();
}
