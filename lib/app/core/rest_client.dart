import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class RestClient extends GetConnect {
  final _backendBaseUrl = 'https://parseapi.back4app.com/functions';

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  Future<void> _load() async {
    httpClient.addRequestModifier(
      (Request request) {
        request.headers['X-Parse-Application-Id'] =
            'xh4cLy55JNkKtLdBzAUADexEXO5xFoM7rIMxCbv9';
        request.headers['X-Parse-REST-API-Key'] =
            'd2X2ddduSgU320QM1SS7OP4QgxGv6ROz7nEhtFrE';
        request.headers['Content-Type'] = 'application/json';

        return request;
      },
    );
  }

  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}

class RestClientException implements Exception {
  final int? code;
  final String message;

  RestClientException(
    this.message, {
    this.code,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
