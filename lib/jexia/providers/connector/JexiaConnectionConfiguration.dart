/// Configuration to connect to jexia service
///
class JexiaConnectionConfiguration {

  /// rest endpoint to jexia service
  final String _host = "2b23210d-91d7-4a37-a1b3-3a7a30b20e9c.app.jexia.com";

  Uri getUriToEndPoint(String endPoint){
    Uri uri = new Uri.https(_host, endPoint);
    return uri;
  }

}