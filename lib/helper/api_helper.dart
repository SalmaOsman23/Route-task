
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<http.Response> getData({
    required String url,
    Map<String, dynamic>? query,
    // dynamic token,
  }) async {
    //var token = CachedHelper.getValue(key: "token");
    var uRL = Uri.parse(url);
    return await http.get(
      uRL,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
       // 'Authorization': 'Bearer $token',
      },
    );
  }
}