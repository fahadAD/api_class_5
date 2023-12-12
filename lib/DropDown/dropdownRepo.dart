import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'dropdownModel.dart';




Future<List<DropdownModel>>  getDropdownRepo() async {
 try{
   final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
   print(response.statusCode);
   print(response.body);

   var data=json.decode(response.body) as List;

   if(response.statusCode==200){
     return data.map((e) {
       final map=e as Map<String,dynamic>;
       return DropdownModel(
           id:  map["id"],
           body :map["body"],
           title :map["title"],
           userId:map["userId"]
       );
     }).toList();
   }
 }on SocketException{
   throw Exception("No Internet");
 }throw Exception("Error Fatching Data");
}
