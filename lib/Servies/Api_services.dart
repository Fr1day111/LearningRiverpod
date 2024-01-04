import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:riverpodtestapp/Models/UserModel.dart';


class ApiServices{
  String endpoint = "https://reqres.in/api/users?page=1";

  Future getUsers()async{
    final response = await http.get(Uri.parse(endpoint));
    if(response.statusCode==200){
      final result=jsonDecode(response.body)['data'];
      return result.map(((e)=> UserModel.fromMap(e))).toList();
    }else{
      return Exception(response.reasonPhrase);
    }

  }

}