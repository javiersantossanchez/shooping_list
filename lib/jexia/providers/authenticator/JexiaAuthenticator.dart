import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shoopinglist/jexia/providers/connector/JexiaConnectionConfiguration.dart';



///
///  Singleton to authenticate on Jexia service.
///
class JexiaAuthenticator {

  static final JexiaAuthenticator _instance = new JexiaAuthenticator._internal();

  final String _authPath = 'auth';

  String _token;

  final JexiaConnectionConfiguration connectorConfiguration = new JexiaConnectionConfiguration();

  factory JexiaAuthenticator() {
    return _instance;
  }

  JexiaAuthenticator._internal();

  Future<String> authenticate() async {

    if(_token == null) {
      try {
        print('Connecting to authentication with Jexia');
        final response = await http.post(this.connectorConfiguration.getUriToEndPoint(_authPath), body: jsonEncode(
            <String, String>{
              'method': 'apk',
              'key': 'd313ed1b-dc27-4aa2-aeb5-72c83a9c7b3f',
              'secret': 'lsHr1DfGarp9z1v0EpD6oYRXQJXisDlwHTU2W1nqibOp9glFLKrAXPT++ZaE0iaP6fniV9ZHG1BRZDv11tHD6w=='
            }));
        _token = json.decode(response.body)['access_token'];
      } catch (e) {
        print('There is a problem on connection with Jexia');
      }
    }
    return _token;
  }




}
