import 'package:flutter/material.dart';

import 'dropdownModel.dart';
import 'dropdownRepo.dart';
class Drop_DownScreen extends StatefulWidget {
  const Drop_DownScreen({super.key});

  @override
  State<Drop_DownScreen> createState() => _Drop_DownScreenState();
}

class _Drop_DownScreenState extends State<Drop_DownScreen> {
  var selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:   SingleChildScrollView(
        child: Column(
          children: [
        FutureBuilder(
            future: getDropdownRepo(),
            builder: (context, snapshot) {
         if(snapshot.hasData){
          return Center(
            child: DropdownButton(
              icon: Icon(Icons.arrow_downward),
              value: selectedValue,
              hint: Text("Select Value"),
              isExpanded: true,
              items: snapshot.data?.map((e){
                 return DropdownMenuItem(
                     value: e.id.toString(),
                     child: Text("${e.id}"));
              }).toList(),
              onChanged: (value) {
             selectedValue=value;
             setState(() {});
            },),
          );
         }else{
           return Center(child: CircularProgressIndicator());
         }
            },),

           ],
        ),
      ),
    );
  }
}
