// http -> post , get
import 'package:http/http.dart' as http;

class HttpService {
  final baseUrl = 'https://api.itbook.store/1.0';
  HttpService._privateConstructor();
  static final HttpService _instance = HttpService._privateConstructor();
  factory HttpService() {
    return _instance;
  }

  Future<http.Response> get(String path) async {
    var url = Uri.parse(baseUrl + path);
    var response = await http.get(url);
    return response;
  }
}
