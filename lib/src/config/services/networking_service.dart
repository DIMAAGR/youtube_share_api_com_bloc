import 'package:http/http.dart' as http;

class Networking {
  String url;

  Networking({required this.url});

  Future<http.Response> get({String path = ''}) => http.get(Uri.parse(url + path));
}
