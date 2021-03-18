import 'dart:async';

import 'package:chopper/chopper.dart';

class AuthHeaderInterceptor implements RequestInterceptor, ResponseInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    final modifiedHeader = Map<String, String>.from(request.headers);
    modifiedHeader.update('authorization',
        (_) => 'Bearer 0d3d9c3c9a4599d3cef1b52404bfd276763cf602',
        ifAbsent: () => 'Bearer 0d3d9c3c9a4599d3cef1b52404bfd276763cf602');

    final modifiedRequest = Request(
        request.method, request.url, request.baseUrl,
        body: request.body,
        headers: modifiedHeader,
        multipart: request.multipart,
        parameters: request.parameters,
        parts: request.parts);
    return modifiedRequest;
  }

  @override
  FutureOr<Response> onResponse(Response response) {
    return response;
  }
}
