import 'dart:convert';

import 'package:capstone_project_2/data/models/user_model.dart';
import 'package:http/http.dart';

class UserRepository {

  final client = Client();
  final url = 'https://be-production-e1c4.up.railway.app/api';
  final tkn = 'eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiIyMDA4aml3b29AZ21haWwuY29tIiwiaWF0IjoxNzUwODMzNzk1LCJleHAiOjE3NTM0MjU3OTV9.LT074XP9OQulHd9FSw35DQSXPA7pccXKw27gJhJp7v7CFSglL66hXyqLvAdoyVGs';

  Future<UserModel?> getMyData() async {
    try {
      final response = await client.get(
        Uri.parse('${url}/user/info'),
        headers: {
          'Authorization' : 'Bearer $tkn',
        }
      );

      final jsonBody = await jsonDecode(response.body);
      if(response.statusCode >= 200 && response.statusCode < 300) {
        // print(jsonBody['data']);
        final myData = UserModel.fromJson(jsonBody['data']);
        print('내 정보 가져오기 성공!');
        return myData;
      }

      print('내 정보 가져오기 실패: ${response.statusCode} ${jsonBody}');
      return null;

    } catch(e) {
      print('내 정보 가져오기 에러다: $e');
      return null;
    }
  }

}