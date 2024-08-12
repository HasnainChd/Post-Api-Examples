import 'dart:convert';

import '../Models/job_model.dart';
import 'package:http/http.dart' as http;

class JobApi{

  Future<jobModel?> getJob(String name, String job)async{
   try{
     var url= Uri.parse('https://reqres.in/api/users');
     final response= await http.post(url,body: {
       'name': name,
       'job': job,
     });
     if(response.statusCode==200 || response.statusCode==201){
       jobModel jModel= jobModel.fromJson(jsonDecode(response.body));
       return jModel;
     }
   }
   catch(e){
     print('error while fetching data $e');
   }
   return null;
}
}