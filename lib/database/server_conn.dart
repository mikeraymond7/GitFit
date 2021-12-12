// ignore_for_file: unused_local_variable
import 'dart:convert';
import 'db_objects.dart';

import 'package:http/http.dart' as http;

class ToServer {
  Future<http.Response> updateUsers(Users user) async {
    // data.Users user = data.Users(
    //     uname: 'mraymond2@pride.hofstra.edu', dob: '12-01-2000', sex: 'm');
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/updateUsers'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'uname': user.uname,
          'dob': user.dob,
          'sex': user.sex,
        },
      ),
    );

    if (response.statusCode == 201) {
      return response;
      //return data.Users.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Update User.');
    }
  }

  Future<http.Response> updateStats(stats) async {
    // data.Users user = data.Users(
    //     uname: 'mraymond2@pride.hofstra.edu', dob: '12-01-2000', sex: 'm');
    var json = stats.toJson();

    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/updateStats'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        json,
      ),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to Update User.');
    }
  }

  Future<Stats> getStats(String uname) async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:5000/getStats?uname=' + uname),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return Stats.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch Stats.');
    }
  }
}
