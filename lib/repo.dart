import 'dart:convert';

import 'package:http/http.dart' as http;

import 'datamodel.dart';


Future<Datamodel>  getEshopRepo() async {

  final String uri="https://webhook.site/93fa3145-d31e-47bb-9e10-f6ae5d5d0e7d";
  var response=await http.get(Uri.parse(uri));

  print(response.statusCode);
  print(response.body);

  var data=jsonDecode(response.body);

  if(response.statusCode==200){
    return Datamodel.fromJson(data);
  }else{
    return Datamodel.fromJson(data);
  }

}