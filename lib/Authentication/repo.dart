import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

Future<bool> getSignupRepo({required String email,required String password}) async {

 final String uri="https://reqres.in/api/register";
var response=await http.post(Uri.parse(uri),body: {"email":email, "password":password,});

 print(response.body);
 print(response.statusCode);

 if(response.statusCode==200){
   var data=jsonDecode(response.body);
   print(data);
      EasyLoading.showSuccess("Account create Done");
      return true;
 }else{
     EasyLoading.showError("Account  Error");
     return false;

 }


}






Future<bool> getSigninRepo({required String email,required String password}) async {

  final String uri="https://reqres.in/api/login";
  var response=await http.post(Uri.parse(uri),body: {"email":email, "password":password,});

  print(response.body);
  print(response.statusCode);

  if(response.statusCode==200){
    var data=jsonDecode(response.body);
    print(data);
    print(data["token"]);
    EasyLoading.showSuccess("Account create Done");
    return true;
  }else{
    EasyLoading.showError("Account  Error");
    return false;

  }


}