import 'dart:convert';
import 'package:http/http.dart' as http;

class DemoApi {
  var base_url = "https://66ed21bf380821644cdb8c6d.mockapi.io/";

  Future<List<dynamic>> getAll() async {
    var res = await http.get(Uri.parse(base_url + 'mockapi'));
    List<dynamic> data = jsonDecode(res.body);
    return data;
  }

  Future<List<dynamic>> deleteUser({id, context}) async {
    var res = await http.delete(Uri.parse(base_url + 'mockapi/$id'));
    List<dynamic> data = jsonDecode(res.body);
    return data;
  }
}
