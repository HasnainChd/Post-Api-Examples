import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Models/register_model.dart';

class RegisterApi{

  Future<RegisterModel?> register(String email, String password)async{
    try{
      var url= Uri.parse('https://reqres.in/api/register');
      final response= await http.post(url,body: {
        'email': email,
        'password': password
      });
      if(response.statusCode==200){
        RegisterModel registerModel= RegisterModel.fromJson(jsonDecode(response.body));
        return registerModel;
      }

    }catch(e){
      print('error while fetching data');
    }
    return null;
  }
}