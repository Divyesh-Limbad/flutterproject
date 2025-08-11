import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://66ed21bf380821644cdb8c6d.mockapi.io/mockapi";

  Future<List<dynamic>> getAllUsers() async {
    var res = await http.get(Uri.parse(baseUrl));
    return jsonDecode(res.body);
  }

  Future<void> addUser(Map<String, dynamic> userData) async {
    await http.post(Uri.parse(baseUrl),
        body: jsonEncode(userData),
        headers: {"Content-Type": "application/json"});
  }

  Future<void> editUser(String id, Map<String, dynamic> updateData) async {
    await http.put(Uri.parse('$baseUrl/$id'),
        body: jsonEncode(updateData),
        headers: {"Content-Type": "application/json"});
  }

  Future<void> deleteUser(String id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
  }
}
