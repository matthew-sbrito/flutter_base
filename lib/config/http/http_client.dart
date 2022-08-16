import 'package:http/http.dart';

/// @author Matheus Brito
/// @profile https://github.com/matthew-sbrito
/// @since 15/08/22
class HttpClient extends BaseClient {
  final Client httpClient = Client();
  final String baseURL;

  HttpClient(this.baseURL);

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    // TODO:: INTERCEPTOR IF NEED

    return httpClient.send(request);
  }

  Future<Response> myGet(String url, {Map<String, String>? headers}) {
    Uri uri = Uri.http("authority", "$baseURL$url");

    return super.get(uri, headers: headers);
  }
}