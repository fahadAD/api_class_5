import 'package:e_shop_api_project/Authentication/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../home.dart';
class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController _Emailcontroller=TextEditingController();
  TextEditingController _passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          TextFormField(
            controller: _Emailcontroller,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: _passwordcontroller,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(height: 10,),

          ElevatedButton(onPressed: () async {
            bool isSigninDone=await  getSigninRepo(email: _Emailcontroller.text, password: _passwordcontroller.text);
            if(isSigninDone){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
            }else{
              EasyLoading.showError("   Error");
            }
          }, child: Text("login"))
        ],
      ),
    );
  }
}
