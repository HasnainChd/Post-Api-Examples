import 'dart:convert';

import 'package:http/http.dart'as http;

import '../Models/login_model.dart';
class ApiService{
  //with model
  Future<LoginModel?> loginPostWithModel(String email, String password)async{
    try{
      var url= Uri.parse('https://reqres.in/api/login');
      final response= await http.post(url,body: {
        "email":email,
        "password":password,
      });
      if(response.statusCode==200){
        LoginModel loginModel= LoginModel.fromJson(jsonDecode(response.body));
        return loginModel;
      }

      return null;
    }catch(e){
      print('error while fetching data : $e');
    }
    return null;
  }

  //without model
  Future<dynamic> loginPostWOutModel(String email , String password)async{
    try{
      var url= Uri.parse('https://reqres.in/api/login');
      final response= await http.post(url,body: {
        'email':email,
        'password':password,
      });
      if(response.statusCode==200){
        final data= jsonDecode(response.body);
        return data;
      }
    }catch(e){
      print(e.toString());
    }

  }
}