import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:field_project/user_model.dart';
import 'dart:convert';

class FetchUserList {
  var data = [];
  List<Userlist> results = [];
  String urlList = 'https://jsonplaceholder.typicode.com/users/';

  Future<List<Userlist>> getuserList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => Userlist.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) =>
                  element.name!.toLowerCase().contains((query.toLowerCase())))
              .toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}


class ApiService {
  static const String _baseUrl = 'https://your-api-url.com';

  static Future<void> updateTicketStatus(int id, String status) async {
    final url = '$_baseUrl/tickets/$id';
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'status': status,
      }),
    );

    if (response.statusCode == 200) {
      print('Ticket status updated successfully.');
    } else {
      throw Exception('Failed to update ticket status.');
    }
  }
}
